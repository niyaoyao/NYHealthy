//
//  GlobalDefinition.swift
//  NYHealthy
//
//  Created by NiYao on 5/19/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import Foundation
import UIKit

let USER_DEFAULT_KEY_USER_INFO = "sune.bear.nycode.health.care.user.information"

let STORYBOARD_ID_USER_BASE_INFO_VIEW_CONTROLLER = "StoryboardIDUserBaseInfoViewController"
let STORYBOARD_ID_TAB_BAR_CONTROLLER = "StoryboardIDTabBarController"

let NOTIFICATION_THEME_STYLE_CHANGED = "sune.bear.nycode.health.care.notification.theme.style.changed"

func controllerForID(_ storyboardID: String) -> UIViewController {
    return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyboardID)
}
