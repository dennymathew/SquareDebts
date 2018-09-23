//
//  Pushable.swift
//  Erudyte
//
//  Created by Denny Mathew on 07/05/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

protocol Pushable {}

extension Pushable where Self: UIView {
    
    func pushRight(_ x: CGFloat) {
        UIView.animate(withDuration: 0.4 * AppConstants.animationScale,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: .allowUserInteraction,
                       animations: {
            self.transform = CGAffineTransform(translationX: x, y: 0)
        })
    }
    
    func pullBack() {
        UIView.animate(withDuration: 0.4 * AppConstants.animationScale,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: .allowUserInteraction,
                       animations: {
            self.transform = .identity
        })
    }
}
