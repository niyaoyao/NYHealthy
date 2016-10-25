//
//  NYDevice.swift
//  NYHealthy
//
//  Created by NiYao on 6/2/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

extension NSObject {
    class func getUUID() -> String {
        var UUID = UIDevice.current.identifierForVendor?.uuidString
        var count = 0
        while UUID == nil {
            UUID = UIDevice.current.identifierForVendor?.uuidString
            count += 1
            if count > 100 {
                break
            }
        }
        return UUID!
    }
    
}
