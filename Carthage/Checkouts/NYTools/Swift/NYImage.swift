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
    class func imageForColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(CGFloat(0), CGFloat(0), size.width, size.height)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    class func unitImageForColor(color: UIColor) -> UIImage {
        return self.classForCoder().imageForColor(color, size: CGSizeMake(CGFloat(1), CGFloat(1)))
    }
}
