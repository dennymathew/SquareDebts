//
//  Fade.swift
//  Erudyte
//
//  Created by Denny Mathew on 26/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

protocol Fadable {}

extension Fadable where Self: UIView {
    
    func fadeIn(_ duration: TimeInterval = 0.09,
                delay: TimeInterval = 0.0,
                completion: @escaping () -> Void = ({})) {
        
        DispatchQueue.main.async {
            self.isHidden = false
            UIView.animate(withDuration: duration * AppConstants.animationScale,
                           delay: delay,
                           options: .curveEaseIn,
                           animations: {
                self.alpha = 1.0
            }) { _ in
                completion()
            }
        }
    }
    
    func fadeOut(_ duration: TimeInterval = 0.09,
                 delay: TimeInterval = 0.0,
                 completion: @escaping () -> Void = ({})) {
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration * AppConstants.animationScale,
                           delay: delay,
                           options: .curveEaseOut,
                           animations: {
                self.alpha = 0.0
            }) { _ in
                completion()
            }
        }
    }
}

extension Fadable where Self: UIButton {
    
    func fadeOutAndInToChangeTitle(_ duration: TimeInterval = 1.0, title: String) {
        
        UIView.animateKeyframes(withDuration: duration * AppConstants.animationScale,
                                delay: 0,
                                options: .beginFromCurrentState,
                                animations: {
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 * duration) {
                                        self.setTitle(title, for: .normal)
                                    }
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0 * duration,
                                                       relativeDuration: 0.5 * AppConstants.animationScale,
                                                       animations: {
                                                        self.alpha = 0.0
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.5 * duration,
                                                       relativeDuration: 0.5 * AppConstants.animationScale,
                                                       animations: {
                                                        self.alpha = 1.0
                                    })
        })
    }
}

extension Fadable where Self: UILabel {
    
    func fadeOutAndInToChangeText(_ text: String) {
        
        UIView.animateKeyframes(withDuration: 1 * AppConstants.animationScale,
                                delay: 0,
                                options: .beginFromCurrentState,
                                animations: {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.text = text
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.5 * AppConstants.animationScale,
                               animations: {
                self.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0.5 * AppConstants.animationScale,
                               animations: {
                self.alpha = 1.0
            })
        })
    }
}

extension Fadable where Self: UITextView {
    
    func fadeOutAndInToChangeText(_ text: String) {
        
        UIView.animateKeyframes(withDuration: 1 * AppConstants.animationScale,
                                delay: 0,
                                options: .beginFromCurrentState,
                                animations: {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.text = text
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.5 * AppConstants.animationScale,
                               animations: {
                self.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0.5 * AppConstants.animationScale,
                               animations: {
                self.alpha = 1.0
            })
        })
    }
}

extension UIView: Fadable {}
