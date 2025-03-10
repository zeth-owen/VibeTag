//
//  TextExtractor.swift
//  VibeTag
//
//  Created by Zeth Thomas on 3/9/25.
//


import UIKit
import Vision

struct TextExtractor {
    
    static func extractText(from image: UIImage, completion: @escaping (String?) -> Void) {
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
            
            print("Cleaned Extracted Text: \(extractedText)")
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
}
