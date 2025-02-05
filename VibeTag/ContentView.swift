//
//  ContentView.swift
//  VibeTag
//
//  Created by Zeth Thomas on 2/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(Vibes.allCases, id: \.self) { vibe in
                NavigationLink(destination: VibeDetailView(vibe: vibe)) {
                    Text(vibe.rawValue)
                        .foregroundColor(.secondary)
                }
            }
            .navigationBarTitle("VibeMenu")
        }
    }
}


#Preview {
    ContentView()
}
