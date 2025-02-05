//
//  CameraView.swift
//  VibeTag
//
//  Created by Zeth Thomas on 2/4/25.
//

import SwiftUI

struct CameraView: View {
    
    let bar: Bar
    
    var body: some View {
        NavigationStack {
            Spacer()
            Image(bar.photoLocation)
                .resizable()
                .frame(width: 350, height: 350)
            
            VStack {
                Text("Take a photo for your tag!")
                    .font(.title)
                    .fontWeight(.bold)
                Button("Take Photo", systemImage: "camera") {
                    print("Hi")
                }
                Spacer()
            }
            .navigationTitle(bar.name)
        }
    }
}

#Preview {
    CameraView(bar: Bar(name: "Piranha Nightclub", description: "A popular LGBTQ+ nightclub with drag shows.", imageName: "Piranha", category: .lgbtqBars))
}
