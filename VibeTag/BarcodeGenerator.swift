//
//  BarcodeGenerator.swift
//  VibeTag
//
//  Created by Zeth Thomas on 3/9/25.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

struct BarcodeGenerator {
    
    let context = CIContext()
    let generator = CIFilter.code128BarcodeGenerator()
    
    func generateBarcode(text: String) -> Image? {
        generator.message = Data(text.utf8)
        
        if let outputImage = generator.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            
            let uiImage = UIImage(cgImage: cgImage)
            return Image(uiImage: uiImage)
        }
        
        return Image(systemName: "barcode")
        
    }
    
}
