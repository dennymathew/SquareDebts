//
//  SDButton.swift
//  Erudyte
//
//  Created by Denny Mathew on 23/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

class SDButton: UIButton, Expandable, Slidable {
    
    var face: Int = 0 {
        didSet {
            if face < faceTitles.count {
                DispatchQueue.main.async {
                    self.setTitle(self.faceTitles[self.face], for: .normal)
                }
            }
        }
    }
    
    lazy var faceTitles: [String] = [title(for: .normal) ?? "", ""]
    var loadingFace: Int {
        return faceTitles.count - 1
    }
    
    var image: UIImage?
    var title: String?
    
    func setLoading() {
        image = self.imageView?.image
        title = self.titleLabel?.text
        DispatchQueue.main.async {
            self.setTitle("", for: .normal)
            self.setImage(nil, for: .normal)
        }
    }
    
    func setDefault() {
        DispatchQueue.main.async {
            self.setTitle(self.title, for: .normal)
            self.setImage(self.image, for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = Colors.primeBlue
        makeRounded()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        makeRounded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        makeRounded()
    }
    
    private func makeRounded() {
        layer.cornerRadius = frame.height/2
        layer.masksToBounds = true
    }
    
    //Highlight on Click
    override open var isHighlighted: Bool {
        didSet {
            if backgroundColor == Colors.primeBlue {
                backgroundColor = isHighlighted ? Colors.primeBlueDark : Colors.primeBlue
            } else if backgroundColor == Colors.primeRed {
                backgroundColor = isHighlighted ? Colors.primeRedDark : Colors.primeRed
            }
        }
    }
}
