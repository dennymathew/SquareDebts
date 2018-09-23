//
//  Enums.swift
//  ErudyteDevelopment
//
//  Created by Denny Mathew on 18/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import Foundation

// MARK: - Gender
@objc enum Gender: Int {
    case male = 0   
    case female = 1
    case neutral = 2
    
    var stringValue: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        default:
            return "neutral"
        }
    }
}
