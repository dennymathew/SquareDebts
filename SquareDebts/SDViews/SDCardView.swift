//
//  SDCardView.swift
//  ErudyteDevelopment
//
//  Created by Denny Mathew on 26/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

class SDCardView: UIView {
    
    var cornerRadius: CGFloat = 10.0
    @IBInspectable var shadowRadius: CGFloat = 10.0
    @IBInspectable var shadowOpacity: Float = 0.5
    
    private let shadowLayer = CALayer()
    private let cornerLayer = CALayer()
    
    override func draw(_ rect: CGRect) {
        
        addShadowAndCurvedCorners()
        
        for view in subviews {
            bringSubviewToFront(view)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = Colors.white
    }
    
    override func layoutSubviews() {
        
        addShadowAndCurvedCorners()
        
        for view in subviews {
            bringSubviewToFront(view)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func addShadowAndCurvedCorners() {
        
        //Add Shadow
        shadowLayer.shadowOffset = CGSize.zero
        shadowLayer.shadowColor = Colors.blackLighter.cgColor
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius
        shadowLayer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        shadowLayer.frame = self.bounds
        layer.addSublayer(shadowLayer)
        
        //Add Curved Corners
        cornerLayer.cornerRadius = cornerRadius
        cornerLayer.frame = shadowLayer.bounds
        cornerLayer.masksToBounds = true
        cornerLayer.backgroundColor = Colors.white.cgColor
        shadowLayer.addSublayer(cornerLayer)
    }
}
