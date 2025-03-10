//
//  BarImageView.swift
//  VibeTag
//
//  Created by Zeth Thomas on 2/25/25.
//

import SwiftUI
import UIKit

struct BarImageView: View {
    
    @State private var isPhotoLibraryPresented = false
    @State private var capturedImage: UIImage?
    @State private var barcode: Image?
    let bar: Bar
    let generator = BarcodeGenerator()
    
    var body: some View {
        VStack {
            if barcode == nil {
                Text(bar.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Image(bar.photoLocation)
                    .resizable()
                    .frame(width: 250, height: 250)
                
                if capturedImage == nil {
                    Text("Upload \(bar.name) vibe for your QRCode")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    Text("""
                    Requirements:
                    Post to Instagram
                    GeoLocation: '\(bar.name)'
                    HashTag: 'VibeTag'
                    """)
                    .font(.caption)
                    .padding()
                    .multilineTextAlignment(.center)
                }
                
                if let capturedImage {
                    Image(uiImage: capturedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    Button("Submit", systemImage: "arrow.up.circle.fill") {
                        TextExtractor.extractText(from: capturedImage) { extractedText in
                            guard let text = extractedText else {
                                print("No text found in image.")
                                return
                            }
                            if VibeVerification.containsHashtag(text, hashtag: "#redrockresort") && VibeVerification.containsBarName(text, barName: bar.name) {
                                barcode = generator.generateBarcode(text: bar.name)
                                } else {
                                    print("Image is not valid. Missing hashtag or bar name.")
                            }
                        }
                    }
                }
                
                Button("Upload Screen Shot", systemImage: "photo") {
                    isPhotoLibraryPresented.toggle()
                }
            }
            if let barcode {
                VStack {
                    if let capturedImage {
                        Image(uiImage: capturedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    }
                    
                    barcode
                        .resizable()
                        .scaledToFit()
                        .frame(width: 230, height: 230)
                }
            }
        }
        
        .sheet(isPresented: $isPhotoLibraryPresented) {
            GalleryView(capturedImage: $capturedImage)
        }
    }
}


#Preview {
    BarImageView(bar: Bar(name: "Piranha Nightclub", description: "A popular LGBTQ+ nightclub with drag shows.", imageName: "Piranha", category: .lgbtqBars))
}
