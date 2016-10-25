//
//  UserBaseInfoModel.swift
//  NYHealthy
//
//  Created by NiYao on 5/20/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class UserBaseInfoModel: NSObject {
    var UDID = ""
    var currentWeight = 0.0
    var targetWeight = 0.0
    var height = 0.0
    var isMale = false
    var age = 0.0
    var currentBMI = 0.0
    var currentFatRate = 0.0
    

    var BMI: Double {
        get {
            return currentWeight/square(height)
        }
        
        set(BMI) {
            currentBMI = BMI
        }
    }
    
    var fatPercent: Double {
        get {
            return BMI * 1.2 + 0.23 * age - 5.4 - 10.8 * Double(isMale)
        }
        
        set(rate) {
            currentFatRate = rate
        }
    }
    
}
