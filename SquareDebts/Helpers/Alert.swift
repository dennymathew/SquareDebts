//
//  Alert.swift
//  SquareDebts
//
//  Created by Denny Mathew on 23/04/18.
//  Copyright © 2018 Densigns. All rights reserved.
//

import UIKit

// MARK: - Alert Strcture
struct Alert {
    
    typealias AlertCompletion = () -> Void
    
    //Properties
    var title: String = ""
    var message: String = ""
    var style: UIAlertController.Style = .alert
    var actions: [UIAlertAction] = []
    var completion: AlertCompletion?
    
    var controller: UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        //Add Default Action if actions array is empty
        if actions.isEmpty {
            let defaultAction = UIAlertAction(title: Texts.Buttons.OK, style: .default, handler: nil)
            alertController.addAction(defaultAction)
        }
            
        //Add actions
        else {
            for action in actions {
                alertController.addAction(action)
            }
        }
        
        return alertController
    }
    
    // MARK: - Alert Data
    struct AlertData {
        let title: String
        let message: String
    }
}

// MARK: - Alertable Protocol
protocol Alertable: class {
    func showAlert(_ alert: Alert)
    func showAlert(_ error: SDError)
    func showAlert(_ title: String, message: String) 
}

extension Alertable where Self: UIViewController {
    
    //Generic Alert with Alert Object as Parameter
    func showAlert(_ alert: Alert) {
        DispatchQueue.main.async {
            self.present(alert.controller, animated: true, completion: alert.completion)
        }
    }
    
    //Generic Alerts with Error Object as Parameter
    func showAlert(_ error: SDError) {
    }
    
    //Simple Generic Alerts
    func showAlert(_ title: String, message: String) {
        var alert = Alert()
        alert.title = title
        alert.message = message
        showAlert(alert)
    }
}
