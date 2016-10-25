//
//  UserProfileViewController.swift
//  NYHealthy
//
//  Created by NiYao on 5/16/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect:CGRect = CGRect(x: 0, y: 0, width: 200, height: 200)
        ThemeManager.sharedManager().tintColor.setStroke()
        let lineWidth:CGFloat = CGFloat(10)
        let center:CGPoint = CGPoint(x: rect.size.width/2.0, y: rect.size.height/2.0)
        let radius = rect.size.width/2.0 - lineWidth
        let startFactor = 1.5
        
        let startAngle =  CGFloat( M_PI * startFactor)
        let circularAngle = CGFloat( M_PI * 2)
        
        let endAngle =  startAngle + circularAngle * CGFloat( 1)
        
        let circelPath:UIBezierPath = UIBezierPath.init(arcCenter: center, radius: radius, startAngle:startAngle, endAngle:endAngle, clockwise: true)
        circelPath.lineWidth = lineWidth
        circelPath.lineCapStyle = CGLineCap.round
        circelPath.stroke()
        
        let rateCircelLayer = CAShapeLayer.init()
        rateCircelLayer.frame = rect
        rateCircelLayer.path = circelPath.cgPath
        rateCircelLayer.fillColor = UIColor.clear.cgColor
        rateCircelLayer.strokeColor = ThemeManager.sharedManager().tintColor.cgColor
        
        let strokeAnimation:CABasicAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 0.5
        strokeAnimation.duration = 20
        rateCircelLayer.add(strokeAnimation, forKey: "circleStroke")
        
        self.view.layer.addSublayer(rateCircelLayer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logout(_ sender: AnyObject) {
         UserManager.sharedManager.clearUser()
        let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        delegate.switchRootViewControllerTo(controllerForID(STORYBOARD_ID_USER_BASE_INFO_VIEW_CONTROLLER))
    }
}
