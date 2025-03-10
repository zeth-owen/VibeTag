//
//  VibeVerification.swift
//  VibeTag
//
//  Created by Zeth Thomas on 3/9/25.
//

import Foundation


struct VibeVerification {
    
    static func containsHashtag(_ text: String, hashtag: String) -> Bool {
        let cleanedText = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return cleanedText.contains(hashtag.lowercased())
    }

    static func containsBarName(_ text: String, barName: String) -> Bool {
        let cleanedText = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return cleanedText.contains(barName.lowercased())
    }

}
