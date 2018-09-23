//
//  SDViewController.swift
//  SquareDebts
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 Densigns. All rights reserved.
//

import UIKit

class SDViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    lazy var spinner: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.activityIndicatorViewStyle = .white
        ai.hidesWhenStopped = true
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.accessibilityIdentifier = "base-activityIndicator"
        return ai
    }()
    
    internal lazy var tapRecognizer: UITapGestureRecognizer = {
        let rec = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        rec.delegate = self
        return rec
    }()
}

// MARK: - Life Cycle
extension SDViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Activity Indicator
extension SDViewController {
    
    private func placeSpinner(on loadingView: UIView? = nil) {
        let spinnerParent: UIView = loadingView ?? self.view
        spinnerParent.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: spinnerParent.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: spinnerParent.centerYAnchor).isActive = true
    }
    
    func startLoading(on loadingView: UIView? = nil, style: UIActivityIndicatorView.Style = .white) {
        DispatchQueue.main.async {
            self.spinner.activityIndicatorViewStyle = style
            self.placeSpinner(on: loadingView)
            self.spinner.startAnimating()
            self.view.isUserInteractionEnabled = false
        }
    }
    
    func finishLoading() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.spinner.removeFromSuperview()
            self.view.isUserInteractionEnabled = true
        }
    }
}

// MARK: - Keyboard Handling
extension SDViewController {
    
    //Add Gestire recognizer
    func hireKeyboardKiller() {
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //Remove Gestire recognizer
    func fireKeyboardkiller() {
        view.removeGestureRecognizer(tapRecognizer)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
