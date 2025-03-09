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
    @State private var extractedText: String?
    let bar: Bar
    
    var body: some View {
        VStack {
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
                          extractTextFromImage(capturedImage) { text in
                              extractedText = text
                              if let extractedText = extractedText {
                                  if containsHashtag(extractedText) && containsBarName(extractedText, barName: "solussly") {
                                      print("Image is valid for submission")
                                  } else {
                                      print("Image is not valid. Missing hashtag or bar name.")
                                  }
                              }
                          }
                      }
            }
            
            Button("Upload Screen Shot", systemImage: "photo") {
                isPhotoLibraryPresented.toggle()
            }
            
            Spacer()
        }
        .sheet(isPresented: $isPhotoLibraryPresented) {
            GalleryView(capturedImage: $capturedImage)
        }
    }
}


#Preview {
    BarImageView(bar: Bar(name: "Piranha Nightclub", description: "A popular LGBTQ+ nightclub with drag shows.", imageName: "Piranha", category: .lgbtqBars))
}
