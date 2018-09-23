//
//  BarChart.swift
//  Erudyte
//
//  Created by Denny Mathew on 5/18/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import UIKit

struct SDBarData {
    
    let color: UIColor
    let height: Float
    let yValue: Int
    let xValue: String
}

class SDBarChart: UIView {
    
    let barWidth: CGFloat = 40.0
    let barInterimSpace: CGFloat = 30.0
    @IBInspectable var emptyDataText: String = ""
    
    private let bottomSpace: CGFloat = 40.0
    private let topSpace: CGFloat = 40.0
    
    private let mainLayer: CALayer = CALayer()
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.isDirectionalLockEnabled = true

        return view
    }()
    
    private lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.text = self.emptyDataText
        lbl.font = UIFont(name: Fonts.msRegular, size: 13)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var barData: [SDBarData]? = nil {
        didSet {
            
            guard var barData = barData else {
                return
            }
            
            //Handle Empty Data
            if barData.isEmpty {
                addSubview(label)
                NSLayoutConstraint.activate([
                    label.centerXAnchor.constraint(equalTo: centerXAnchor),
                    label.centerYAnchor.constraint(equalTo: centerYAnchor)
                    ])

                return
            }

            label.removeFromSuperview()
            
            mainLayer.sublayers?.forEach({$0.removeFromSuperlayer()})
            
            scrollView.contentSize = CGSize(width: (barWidth + barInterimSpace) * CGFloat(barData.count), height: frame.size.height)
            mainLayer.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
            
//            drawHorizontalLines()
            
            for index in 0..<barData.count {
                showData(index, data: barData[index])
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupChartView()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        setupChartView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupChartView()
    }
    
    override func layoutSubviews() {
        scrollView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        let endOffset = CGPoint(x: scrollView.contentSize.width - scrollView.frame.size.width, y: 0)
        scrollView.setContentOffset(endOffset, animated: false)
    }
}

extension SDBarChart {
    
    private func setupChartView() {
        scrollView.layer.addSublayer(mainLayer)
        addSubview(scrollView)
    }
    
    private func showData(_ index: Int, data: SDBarData) {
        
        let x: CGFloat = barInterimSpace + CGFloat(index) * (barWidth + barInterimSpace)
        let y: CGFloat = getYFromHeight(data.height)
        
        drawBar(x, y: y, color: data.color)
        addValues(x - barInterimSpace/2, y: Int(y - 30), value: data.yValue, color: data.color)
        addXTitle(x - barInterimSpace/2, y: mainLayer.frame.height - bottomSpace + 10, title: data.xValue, color: data.color)
    }
    
    private func drawBar(_ x: CGFloat, y: CGFloat, color: UIColor) {
        
        let barLayer = CALayer()
        barLayer.frame = CGRect(x: x, y: y, width: barWidth, height: mainLayer.frame.height - bottomSpace - y)
        barLayer.backgroundColor = color.cgColor
        mainLayer.addSublayer(barLayer)
    }
    
    private func drawHorizontalLines() {
        
        layer.sublayers?.forEach({
            if $0 is CAShapeLayer {
                $0.removeFromSuperlayer()
            }
        })
        
        for index in 1...5 {
            let x = CGFloat(0.0)
            let y = getYFromHeight(Float(1/index))
            let path = UIBezierPath()
            path.move(to: CGPoint(x: x, y: y))
            path.addLine(to: CGPoint(x: scrollView.frame.size.width, y: y))
            let lineLayer = CAShapeLayer()
            lineLayer.path = path.cgPath
            lineLayer.lineWidth = 0.5
            lineLayer.strokeColor = Colors.whiteDark.cgColor
            layer.insertSublayer(lineLayer, at: 0)
        }
    }
    
    private func addValues(_ x: CGFloat, y: Int, value: Int, color: UIColor) {
        
        let valueLayer = CATextLayer()
        valueLayer.frame = CGRect(x: x, y: CGFloat(y), width: barWidth + barInterimSpace, height: 20.0)
        valueLayer.foregroundColor = color.cgColor
        valueLayer.backgroundColor = UIColor.clear.cgColor
//        valueLayer.alignmentMode = kCAAlignmentCenter
        valueLayer.contentsScale = UIScreen.main.scale
        valueLayer.font = CTFontCreateWithName(Fonts.msRegular as CFString, 0, nil)
        valueLayer.fontSize = 13
        valueLayer.string = "\(value)"
        mainLayer.addSublayer(valueLayer)
    }
    
    private func addXTitle(_ x: CGFloat, y: CGFloat, title: String, color: UIColor) {
        
        let titleLayer = CATextLayer()
        titleLayer.frame = CGRect(x: x, y: y, width: barWidth + barInterimSpace, height: 20)
        titleLayer.foregroundColor = color.cgColor
        titleLayer.backgroundColor = UIColor.clear.cgColor
//        titleLayer.alignmentMode = kCAAlignmentCenter
        titleLayer.contentsScale = UIScreen.main.scale
        titleLayer.font = CTFontCreateWithName(Fonts.msRegular as CFString, 0, nil)
        titleLayer.fontSize = 10
        titleLayer.string = "\(title)"
        mainLayer.addSublayer(titleLayer)
    }
    
    private func getYFromHeight(_ height: Float) -> CGFloat {
        let height: CGFloat = CGFloat(height) * (mainLayer.frame.height - bottomSpace - topSpace)
        return mainLayer.frame.height - bottomSpace - height
    }
}
