//
//  VibeDetailView.swift
//  VibeTag
//
//  Created by Zeth Thomas on 2/4/25.
//

import SwiftUI

struct VibeDetailView: View {
    
    let vibe: Vibes
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Spacer()
                LazyVGrid(columns: columns) {
                    ForEach(VibesData.vibes[vibe] ?? []) { bar in
                        VStack {
                            Image(bar.imageName)
                                .resizable()
                                .frame(width: 80, height: 80)
                            Text(bar.name)
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .center)
                            Text(bar.description)
                                .font(.caption)
                                .lineLimit(2)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        
                    }
                    .padding()
                }
                .navigationTitle(vibe.rawValue)
            }
        }
    }
}

#Preview {
    VibeDetailView(vibe: .nightclubs)
}
