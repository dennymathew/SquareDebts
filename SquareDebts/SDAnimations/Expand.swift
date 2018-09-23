//
//  Roundable.swift
//  Erudyte
//
//  Created by Denny Mathew on 04/05/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

protocol Expandable {}

extension Expandable where Self: UIView {
    
    func expand() {
        
        let newButtonWidth = frame.width * 3
        
        /* Do Animations */
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0 * AppConstants.animationScale)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))
        
        // View animations
        UIView.animate(withDuration: 1.0 * AppConstants.animationScale,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1.0,
                       options: .allowAnimatedContent,
                       animations: {
            self.frame = CGRect(x: self.frame.minX,
                                y: self.frame.minY,
                                width: newButtonWidth,
                                height: self.frame.height)
        }, completion: nil)
        
        CATransaction.commit()        
    }
}
