//
//  Pop.swift
//  Erudyte
//
//  Created by Denny Mathew on 05/05/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

protocol Popable {}

extension Popable where Self: UIView {
    
    func popOut(_ popDuration: TimeInterval = 0.1,
                outDuration: TimeInterval = 0.7,
                delay: TimeInterval = 0,
                damping: CGFloat = 0.7,
                shouldHide: Bool = true,
                completion: @escaping () -> Void = ({})) {

        UIView.animate(withDuration: popDuration * AppConstants.animationScale,
                       delay: delay,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: [],
                       animations: {
            self.alpha = 0.9
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: outDuration * AppConstants.animationScale,
                           delay: delay,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.5,
                           options: [],
                           animations: {
                self.alpha = 0
                self.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            }) { _ in
                self.isHidden = shouldHide
                completion()
            }
        }
    }
    
    func popIn(_ duration: TimeInterval = 0.7,
               delay: TimeInterval = 0,
               damping: CGFloat = 0.6,
               initialVelocity: CGFloat = 0.5,
               completion: @escaping () -> Void = ({})) {
        
        DispatchQueue.main.async {
            self.alpha = 0.0
            self.isHidden = false
            self.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: duration * AppConstants.animationScale,
                           delay: delay,
                           usingSpringWithDamping: damping,
                           initialSpringVelocity: initialVelocity,
                           options: [.allowUserInteraction, .allowAnimatedContent],
                           animations: {
                self.alpha = 1.0
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { _ in
                completion()
            }
        }
    }
}

extension Popable where Self: UIButton {
    
    func popOutAndInToChangeImage(_ image: UIImage, duration: TimeInterval = 1.0) {
        
        UIView.animateKeyframes(withDuration: duration * AppConstants.animationScale,
                                delay: 0,
                                options: .beginFromCurrentState,
                                animations: {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration * AppConstants.animationScale/2) {
                self.setImage(image, for: .normal)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: duration * 0.1 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1,
                               relativeDuration: duration * 0.4 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: duration * 0.4 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9,
                               relativeDuration: duration * 0.1 * AppConstants.animationScale,
                               animations: {
                self.transform = .identity
            })
            
        })
    }
    
    func popOutAndInToChange(attributes title: String,
                             titleColor: UIColor,
                             backgroundColor: UIColor,
                             backgroundLayer: CALayer? = nil,
                             borderColor: UIColor? = nil) {
        
        UIView.animateKeyframes(withDuration: 1 * AppConstants.animationScale,
                                delay: 0,
                                options: .beginFromCurrentState,
                                animations: {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                //Title
                self.setTitle(title, for: .normal)
                
                //Title Color
                self.setTitleColor(titleColor, for: .normal)

                //Background & Border Color
                if backgroundLayer != nil {
                    backgroundLayer?.backgroundColor = backgroundColor.cgColor
                    backgroundLayer?.borderColor = borderColor?.cgColor
                } else {
                    self.backgroundColor = backgroundColor
                    self.layer.borderColor = borderColor?.cgColor
                }
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.1 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1,
                               relativeDuration: 0.4 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0.4 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9,
                               relativeDuration: 0.1 * AppConstants.animationScale,
                               animations: {
                self.transform = .identity
            })
            
        })
    }
}

extension Popable where Self: UILabel {
    
    func popOutAndInToChangeText(_ text: String) {
        
        UIView.animateKeyframes(withDuration: 1 * AppConstants.animationScale,
                                delay: 0,
                                options: .beginFromCurrentState,
                                animations: {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.text = text
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.1 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1,
                               relativeDuration: 0.4 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0.4 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9,
                               relativeDuration: 0.1 * AppConstants.animationScale,
                               animations: {
                self.transform = .identity
            })
        })
    }
}

extension Popable where Self: UIImageView {
    
    func popOutAndInToChangeImage(_ image: UIImage,
                                  duration: TimeInterval = 1.0) {
        
        UIView.animateKeyframes(withDuration: duration * AppConstants.animationScale,
                                delay: 0,
                                options: .beginFromCurrentState,
                                animations: {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration * AppConstants.animationScale/2) {
                self.image = image
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: duration * 0.1 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1,
                               relativeDuration: duration * 0.4 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: duration * 0.4 * AppConstants.animationScale,
                               animations: {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9,
                               relativeDuration: duration * 0.1 * AppConstants.animationScale,
                               animations: {
                self.transform = .identity
            })
        })
    }
}

extension UIView: Popable {}
