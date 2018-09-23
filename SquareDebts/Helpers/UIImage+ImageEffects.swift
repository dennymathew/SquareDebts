//
//  UIImage+ImageEffects.swift
//  Erudyte
//
//  Created by Aswathy C R on 13/06/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import Foundation
import UIKit

enum ImageMaskingError: Error {
    case insufficientParams
    case failedToGetImage
}

extension UIImage {
    
    func imageMaskedWith(color: UIColor) throws -> UIImage {
        let imageRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        var newImage: UIImage?
        
        UIGraphicsBeginImageContextWithOptions(imageRect.size, false, scale)
        if let context = UIGraphicsGetCurrentContext(), let cgImage = self.cgImage {
            context.scaleBy(x: 1, y: -1)
            context.translateBy(x: 0, y: -(imageRect.size.height))
            context.clip(to: imageRect, mask: cgImage)
            context.setFillColor(color.cgColor)
            context.fill(imageRect)
            
            defer {
                UIGraphicsEndImageContext()
            }
            
            guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
                throw ImageMaskingError.failedToGetImage
            }
            
            return newImage
        } else {
            throw ImageMaskingError.insufficientParams
        }
    }
    
}
