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
    
    func setupBugly() {
        Bugly.start(withAppId: "900041157")
    }
    
    func setupRootViewController() {
        let userDefault = UserDefaults.standard
        let userInfo = userDefault.object(forKey: USER_DEFAULT_KEY_USER_INFO) as? NSDictionary
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let storyboardID = userInfo == nil ? STORYBOARD_ID_USER_BASE_INFO_VIEW_CONTROLLER : STORYBOARD_ID_TAB_BAR_CONTROLLER
        window!.rootViewController = controllerForID(storyboardID)
        window!.makeKeyAndVisible()
    }
    
    func switchRootViewControllerTo(_ destinationController: UIViewController) {
        if window?.rootViewController == nil {
            window?.rootViewController = destinationController
            window?.makeKeyAndVisible()
        } else {
            if window?.rootViewController?.presentedViewController != nil {
                window?.rootViewController?.dismiss(animated: false, completion: { 
                    self.window?.rootViewController = destinationController
                })
            } else {
                window?.rootViewController = destinationController
            }
        }
        
    }
    
    func setupAppearance() {
        setupWindowAppearance()
        setupTabBarAppearance()
        setupNavigationBarAppearance()
    }
    
    fileprivate func setupTabBarAppearance() {
        let tabBar:UITabBar = UITabBar.appearance()
        tabBar.tintColor = ThemeManager.sharedManager().themeColor
        tabBar.backgroundImage = UIImage.unitImageForColor(UIColor.colorForAlpha(COLOR_HEX_WHITE, alpha: CGFloat( 0.9)))
        tabBar.shadowImage = UIImage.unitImageForColor(UIColor.colorForAlpha(COLOR_HEX_WHITE, alpha: CGFloat(0)))
        tabBar.isTranslucent = true
    }
    
    fileprivate func setupNavigationBarAppearance() {
        let navigationBar:UINavigationBar = UINavigationBar.appearance()
        navigationBar.tintColor = ThemeManager.sharedManager().forgroundColor
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage.unitImageForColor(ThemeManager.sharedManager().backgroundColor),
                                         for: UIBarMetrics.default)
    }
    
    fileprivate func setupWindowAppearance() {
        window?.layer.cornerRadius = CGFloat(5)
        window?.layer.masksToBounds = true
    }
    
    func setupLocationService() {
        weak var weakSelf:AppDelegate! = self
        LocationService.commonService.startLocationServiceFailure { (type) in
            switch type {
            case LocationServiceClosureType.authorizationStatusDenied:
                break
            case LocationServiceClosureType.locationServicesNotEnabled:
                weakSelf.openSettings()
                break
            default:
                break
                
            }
        }
    }
    
    func openSettings() {
        if #available(iOS 8.0, *) {
            let settingURL:URL = URL.init(string: UIApplicationOpenSettingsURLString)!
            if UIApplication.shared.canOpenURL(settingURL) {
                UIApplication.shared.openURL(settingURL)
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
}
