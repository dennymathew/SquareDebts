//
//  Slidable.swift
//  Erudyte
//
//  Created by Denny Mathew on 27/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

protocol Slidable {}

extension Slidable where Self: UIView {
    
    //Generic
    func slideInFromBottom() {
        self.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
        UIView.animate(withDuration: 1.0 * AppConstants.animationScale,
                       animations: {
            self.transform = .identity
        })
    }
    
    func slideInFromTop() {
        
    }
    
    func slideOutToBottom() {
        
    }
    
    func slideOutToTop() {
        
    }
    
    func slideTo(_ x: CGFloat) {
        
        UIView.animate(withDuration: 1.0 * AppConstants.animationScale,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1.0,
                       options: .allowAnimatedContent,
                       animations: {
            self.transform = CGAffineTransform(translationX: x, y: 0)
        }, completion: nil)
    }
    
    //Custom
    func slideVertically(by y: CGFloat,
                         duration: TimeInterval = 1.0,
                         delay: TimeInterval = 0) {
        UIView.animate(withDuration: duration * AppConstants.animationScale,
                       delay: delay,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1.0,
                       options: .allowAnimatedContent,
                       animations: {
            self.transform = CGAffineTransform(translationX: 0, y: (-1) * y)
        })
    }
    
    func slideBackToPlace(_ duration: TimeInterval = 1.0,
                          delay: TimeInterval = 0) {
        UIView.animate(withDuration: duration * AppConstants.animationScale,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1.0,
                       options: .allowAnimatedContent,
                       animations: {
            self.transform = .identity
        })
    }
}
