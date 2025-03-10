//
//  Verification.swift
//  VibeTag
//
//  Created by Zeth Thomas on 3/8/25.
//

import SwiftUI
import Vision


func extractTextFromImage(_ image: UIImage, completion: @escaping (String?) -> Void) {
    guard let cgImage = image.cgImage else {
        completion(nil)
        return
    }
    
    let request = VNRecognizeTextRequest { request, error in
        if let error = error {
            print("Error recognizing text: \(error)")
            completion(nil)
            return
        }
        
        var extractedText = ""
        for observation in request.results as? [VNRecognizedTextObservation] ?? [] {
            if let topCandidate = observation.topCandidates(1).first {
                extractedText += topCandidate.string
            }
        }
        
        completion(extractedText)
    }
    
    let requests: [VNRequest] = [request]
    let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
    do {
        try handler.perform(requests)
    } catch {
        print("Error performing image request: \(error)")
        completion(nil)
    }
}


func containsHashtag(_ text: String) -> Bool {
    return text.contains("#redrockresort")
}

func containsBarName(_ text: String, barName: String) -> Bool {
    return text.contains(barName)
}


