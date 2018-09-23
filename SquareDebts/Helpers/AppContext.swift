//
//  AppContext.swift
//  Erudyte
//
//  Created by Denny Mathew on 6/7/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

class AppContext {
    
    static let shared = AppContext()
    
    private init() {
        Logger.log("The AppContext is born!")
    }

    var keyboardWillShowObserver: NSObjectProtocol?
    var keyboardWillHideObserver: NSObjectProtocol?
}
