//
//  ThemeManager.swift
//  NYHealthy
//
//  Created by NiYao on 6/2/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

enum ThemeStyle {
    case defaultStyle
    case pinkStyle
    case yellowStyle
}



class ThemeManager: NSObject {
    fileprivate static let themeManager = ThemeManager()
    class func sharedManager() -> ThemeManager {
        return themeManager
    }
    
    var tintColor: UIColor = PINK_TINT_COLOR
    var forgroundColor: UIColor = PINK_FOREGRUOND_COLOR
    var backgroundColor: UIColor = PINK_BACKGROUND_COLOR
    var themeColor: UIColor = PINK_THEME_COLOR
    
    var themeStyle = ThemeStyle.defaultStyle
    
    var currentStyle:ThemeStyle {
        get {
            return themeStyle
        }
        
        set(style) {
            themeStyle = style
            switch themeStyle {
            case .pinkStyle:
                tintColor       = PINK_TINT_COLOR
                forgroundColor  = PINK_FOREGRUOND_COLOR
                backgroundColor = PINK_BACKGROUND_COLOR
                themeColor      = PINK_THEME_COLOR
                break
            case .yellowStyle:
                tintColor = YELLOW_TINT_COLOR
                forgroundColor = YELLOW_FOREGRUOND_COLOR
                backgroundColor = YELLOW_BACKGROUND_COLOR
                themeColor = YELLOW_THEME_COLOR
                break
            default:
                break
            }
            NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFICATION_THEME_STYLE_CHANGED), object: nil)
        }
    }
    
}
