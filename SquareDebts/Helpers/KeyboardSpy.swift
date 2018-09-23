//
//  KeyboardSpy
//  SquareDebts
//
//  Created by Denny Mathew on 06/05/18.
//  Copyright © 2018 Densigns. All rights reserved.
//

import UIKit

/*********************************************************************
 KeyboardSpy is on a rescue mission to save the employer subviews from
 drowning under the keyboard frame. Once he sees the keyboard poping up,
 he finds out the first responder, scrolls up the parent view so that
 the first responder is always above the keyboard frame.
 ********************************************************************/
protocol KeyboardSpy {
    func keyboardNotifications(_ shouldRegister: Bool)
    var container: UIView { get }
}

extension KeyboardSpy where Self: SDViewController {
    
    //Register for Keyboard Notifications
    func keyboardNotifications(_ shouldRegister: Bool) {
        
        if shouldRegister {
            
            AppContext.shared.keyboardWillShowObserver = NotificationCenter
                .default
                .addObserver(forName: UIResponder.keyboardWillShowNotification,
                             object: nil,
                             queue: OperationQueue.main,
                             using: handler(_:))
            
            AppContext.shared.keyboardWillHideObserver = NotificationCenter
                .default
                .addObserver(forName: UIResponder.keyboardWillHideNotification,
                             object: nil,
                             queue: OperationQueue.main,
                             using: handler(_:))
        } else {
            
            guard let showObserver = AppContext.shared.keyboardWillShowObserver,
                let hideObserver = AppContext.shared.keyboardWillHideObserver else {
                    return
            }
            
            NotificationCenter.default.removeObserver(showObserver, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(hideObserver, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
    
    //Handler Notification
    private func handler(_ notification: Notification) {
        
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        guard let animationDuration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        let up = notification.name == UIResponder.keyboardWillShowNotification
        
        let firstResponder = findFirstResponder(in: container)
        
        if let firstResponder = firstResponder {
            
            let movementDuration: TimeInterval = animationDuration
            UIView.beginAnimations("animateView", context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            UIView.setAnimationDuration(movementDuration)
            
            let frame = firstResponder.frame
            let visibleContainerHeight = container.frame.height - keyboardRect.height
            let firstResponderPosition = frame.origin.y + frame.height
            
            let offsetY = visibleContainerHeight - firstResponderPosition
            let bottomPadding: CGFloat = 2
            
            if up {
                
                //Add Gesture Recognizer to View
                self.hireKeyboardKiller()
                
                //Push Views Up
                if firstResponderPosition > visibleContainerHeight && !(container is UIScrollView) {
                    container.transform = CGAffineTransform(translationX: 0, y: offsetY)
                } else if container is UIScrollView {
                    
                    (container as? UIScrollView)?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardRect.height + bottomPadding, right: 0)
                    
                    var frame: CGRect
                    
                    if let rect = firstResponder.superview?.convert(firstResponder.frame, to: container) {
                        frame = rect
                    } else {
                        frame = firstResponder.frame
                    }
                    
                    (container as? UIScrollView)?.scrollRectToVisible(frame.offsetBy(dx: 0, dy: bottomPadding), animated: true)
                }
            } else {
                
                //Add Gesture Recognizer to View
                self.fireKeyboardkiller()
                
                //Pull Views Down
                if let container = container as? UIScrollView {
                    container.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                } else {
                    container.transform = CGAffineTransform.identity
                }
            }
            
            UIView.commitAnimations()
        }
    }
    
    //Find First Responder TextField Object
    private func findFirstResponder(in view: UIView) -> UIView? {
        
        for subView in view.subviews {
            
            if subView.isFirstResponder {
                return subView
            }
            
            if let recursiveSubView = self.findFirstResponder(in: subView) {
                return recursiveSubView
            }
        }
        
        return nil
    }
}
