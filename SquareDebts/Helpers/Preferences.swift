//
//  Preferences
//  SquareDebts
//
//  Created by Denny Mathew on 21/04/18.
//  Copyright © 2018 Densigns. All rights reserved.
//

import Foundation

// MARK: - Application Settings
@objc private protocol AppPreferenceConfigurable {
    
    //Application Data
    static var isPilotLaunch: Bool { get set }
}

// MARK: - User Settings
@objc private protocol UserPreferenceConfigurable {
    
    //User Profile Data
    static var firstName: String { get set }
    static var lastName: String { get set }
    @objc static var gender: Gender { get set }
}

// MARK: - App Settings
class Preferences: NSObject {
    
    //Set Value
    fileprivate static func updateDefaults(for key: String, value: Any) {
        //Save value to User Defaults
        UserDefaults.standard.set(value, forKey: key)
    }
    
    //Get Value
    fileprivate static func value<T>(for key: String) -> T? {
        //Get value from User Defaults
        return UserDefaults.standard.value(forKey: key) as? T
    }
    
    //Sync UserDefaults
    static func sync() {
        UserDefaults.standard.synchronize()
    }
    
    //Clear UserDefaults
    static func clear() {
        UserDefaults.standard.removePersistentDomain(forName: AppConstants.bundleIdentifier)
        UserDefaults.standard.synchronize()
    }
}

extension Preferences: AppPreferenceConfigurable {
    
    static var isPilotLaunch: Bool {
        get { return Preferences.value(for: #keyPath(isPilotLaunch)) ?? true }
        set { Preferences.updateDefaults(for: #keyPath(isPilotLaunch), value: newValue) }
    }
}

extension Preferences: UserPreferenceConfigurable {
    
    static var name: String {
        if firstName.clean.isEmpty {
            return ""
        }
        
        return Preferences.firstName + " " + Preferences.lastName
    }
    
    static var firstName: String {
        get { return Preferences.value(for: #keyPath(firstName)) ?? "" }
        set { Preferences.updateDefaults(for: #keyPath(firstName), value: newValue) }
    }
    
    static var lastName: String {
        get { return Preferences.value(for: #keyPath(lastName)) ?? "" }
        set { Preferences.updateDefaults(for: #keyPath(lastName), value: newValue) }
    }
    
    static var gender: Gender {
        get { return Gender(rawValue: Preferences.value(for: #keyPath(gender)) ?? 0)! }
        set { Preferences.updateDefaults(for: #keyPath(gender), value: newValue.rawValue) }
    }
}
