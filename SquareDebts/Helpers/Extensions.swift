//
//  Extensions.swift
//  ErudyteDevelopment
//
//  Created by Denny Mathew on 20/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

extension String {
    
    //Removing Spaces
    var clean: String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: " "))
    }
    
    var trimTrailingWhiteSpaces: String {
        return self.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

//Notification for Idle Time Out
extension Notification.Name {
    static let idleTimeOut = Notification.Name(rawValue: "idleTimeOut")
    static let appStateChange = Notification.Name("appStateChange")
}

//Alertable Protocol, IdleTime and Keyboard Spies
extension UIViewController: Alertable {}
