//
//  Zoom.swift
//  Erudyte
//
//  Created by Denny Mathew on 5/14/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

protocol Highlightable {}

extension Highlightable where Self: UIView {
    
    func highLight(_ popDuration: TimeInterval = 0.1, outDuration: TimeInterval = 0.7, delay: TimeInterval = 0) {
        
            UIView.animate(withDuration: popDuration * AppConstants.animationScale,
                           delay: delay,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.5,
                           options: [],
                           animations: {
                self.alpha = 0.9
                self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            }) { _ in
                UIView.animate(withDuration: outDuration * AppConstants.animationScale,
                               delay: delay,
                               usingSpringWithDamping: 0.3,
                               initialSpringVelocity: 0,
                               options: .curveLinear,
                               animations: {
                    self.transform = CGAffineTransform.identity
                }
            )}
    }
}
