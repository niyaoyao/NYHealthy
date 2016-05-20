//
//  AppDelegateExtension.swift
//  NYHealthy
//
//  Created by NiYao on 5/19/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    func initRootViewController() {
        let userDefault = NSUserDefaults.standardUserDefaults()
        let userInfo = userDefault.objectForKey(USER_DEFAULT_KEY_USER_INFO) as? NSDictionary
        window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = userInfo == nil ? STORYBOARD_VIEW_CONTROLLER_USER_BASE_INFO : STORYBOARD_VIEW_CONTROLLER_TAB_BAR_CONTROLLER
        window!.makeKeyAndVisible()
    }
}