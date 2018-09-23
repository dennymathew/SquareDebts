//
//  Jump.swift
//  Erudyte
//
//  Created by Denny Mathew on 04/05/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

protocol Jumpable {}

extension Jumpable where Self: UIView {
    
    func jumpIn() {
        
        self.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
        UIView.animate(withDuration: 0.8 * AppConstants.animationScale,
                       delay: 0.01,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 1.5,
                       options: .allowUserInteraction,
                       animations: {
            self.transform = .identity
        }, completion: nil)
    }
}
