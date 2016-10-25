//
//  NYDevice.swift
//  NYHealthy
//
//  Created by NiYao on 6/2/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

extension NSObject {
    class func getUUID() -> String {
        var UUID = UIDevice.currentDevice().identifierForVendor?.UUIDString
        var count = 0
        while UUID == nil {
            UUID = UIDevice.currentDevice().identifierForVendor?.UUIDString
            count += 1
            if count > 100 {
                break
            }
        }
        return UUID!
    }
    
}