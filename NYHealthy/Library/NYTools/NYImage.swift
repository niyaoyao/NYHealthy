//
//  NYImage.swift
//  NYHealthy
//
//  Created by NiYao on 6/2/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    class func imageForColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: CGFloat(0), y: CGFloat(0), width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    class func unitImageForColor(_ color: UIColor) -> UIImage {
        return self.classForCoder().imageForColor(color, size: CGSize(width: CGFloat(1), height: CGFloat(1)))
    }
}
