//
//  Jitter.swift
//  Erudyte
//
//  Created by Denny Mathew on 26/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

protocol Jitterable {}

extension Jitterable where Self: UIView {
    
    func jitter() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.03 * AppConstants.animationScale
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 3.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 3.0, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}
