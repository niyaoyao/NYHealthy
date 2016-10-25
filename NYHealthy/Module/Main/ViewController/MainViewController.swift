//
//  MainViewController.swift
//  NYHealthy
//
//  Created by NiYao on 5/16/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector:#selector(MainViewController.changeThemeStyle), name: NSNotification.Name(rawValue: NOTIFICATION_THEME_STYLE_CHANGED), object: nil)
       
        let offset = CGFloat(5.0);
        for item:UITabBarItem in self.tabBar.items! {
            item.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
            item.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func changeThemeStyle() {
        
    }
}
