//
//  AppConstants.swift
//  ErudyteDevelopment
//
//  Created by Denny Mathew on 18/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

struct AppConstants {
    
    //AppName
    static let appName = "Square Debts"
    
    //Bundle Identifier
    static var bundleIdentifier: String {
        guard let bundleId = Bundle.main.bundleIdentifier else {
            return ""
        }
        
        return bundleId
    }
    
    //Animation Scale
    static let animationScale = 1.0
}
