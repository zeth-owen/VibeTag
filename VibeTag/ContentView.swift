//
//  ContentView.swift
//  VibeTag
//
//  Created by Zeth Thomas on 2/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                Text("Profile View")
                    .font(.largeTitle)
                    .padding()
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle.fill")
            }
            
            NavigationStack {
                    List(Vibes.allCases, id: \.self) { vibe in
                        NavigationLink(destination: VibeDetailView(vibe: vibe)) {
                            Text(vibe.rawValue)
                                .foregroundColor(.secondary)
                        }
                    }
                    .navigationBarTitle("VibeMenu")
            }
            .tabItem {
                Label("Vibe Menu", systemImage: "bolt.horizontal")
            
              
            }
            
            NavigationStack {
                Text("Scanner View")
                    .font(.largeTitle)
                    .padding()
            }
            .tabItem {
                Label("Scanner", systemImage: "barcode.viewfinder")
            }
        }
    }
}

#Preview {
    ContentView()
}
