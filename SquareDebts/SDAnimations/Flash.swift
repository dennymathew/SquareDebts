//
//  Flash.swift
//  Erudyte
//
//  Created by Denny Mathew on 26/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

protocol Flashable {}

extension Flashable where Self: UIView {
    
    func flash() {
        UIView.animate(withDuration: 0.3 * AppConstants.animationScale,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
            self.alpha = 1.0
        }) { (animationComplete) in
            if animationComplete {
                UIView.animate(withDuration: 0.3 * AppConstants.animationScale,
                               delay: 0,
                               options: .curveEaseOut,
                               animations: {
                    self.alpha = 0.0
                }, completion: nil)
            }
        }
    }
}
