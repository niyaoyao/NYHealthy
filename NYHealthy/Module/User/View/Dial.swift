//
//  Dial.swift
//  NYHealthy
//
//  Created by NiYao on 6/8/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class Dial: UIView {
    fileprivate let rateCircleLayer:CAShapeLayer =  CAShapeLayer.init()
    fileprivate var rate:Double = 0.0
    fileprivate var rateCirclePath:UIBezierPath!
    
    override func awakeFromNib() {
        layer.addSublayer(rateCircleLayer)
    }
    
    var circleRate:Double {
        get {
            return rate
        }
        set(circleRate) {
            rate = circleRate
        }
    }
    
    func  drawCircle() {
        let rect = self.bounds
        
        let lineWidth:CGFloat = CGFloat(10)
        let center:CGPoint = CGPoint(x: rect.size.width/2.0, y: rect.size.height/2.0)
        let radius = rect.size.width/2.0 - lineWidth
        let startFactor = 1.5
        let startAngle =  CGFloat( M_PI * startFactor)
        let circularAngle = CGFloat( M_PI * 2)
        let endAngle =  startAngle + circularAngle * CGFloat( rate )
        rateCirclePath = UIBezierPath.init(arcCenter: center, radius: radius, startAngle:startAngle, endAngle:endAngle, clockwise: true)
        
        rateCircleLayer.frame = rect
        rateCircleLayer.path = rateCirclePath.cgPath
        rateCircleLayer.fillColor = UIColor.clear.cgColor
        rateCircleLayer.strokeColor = ThemeManager.sharedManager().tintColor.cgColor
        rateCircleLayer.lineWidth = lineWidth
        rateCircleLayer.lineCap = kCALineCapRound

        let strokeAnimation:CABasicAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = 1
        rateCircleLayer.add(strokeAnimation, forKey: strokeAnimation.keyPath)
    }
}
