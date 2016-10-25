//
//  UserManager.swift
//  NYHealthy
//
//  Created by NiYao on 6/1/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    fileprivate static let userManager = UserManager()
    
    class var sharedManager: UserManager {
        return userManager
    }
    
    var user: UserBaseInfoModel {
        get {
            let userDefault = UserDefaults.standard
            let userDictionary:Dictionary<String, AnyObject> = (userDefault.value(forKey: USER_DEFAULT_KEY_USER_INFO) == nil) ?
            [:] : userDefault.value(forKey: USER_DEFAULT_KEY_USER_INFO) as! Dictionary<String, AnyObject>
            return UserBaseInfoModel.objectWithDictionary(userDictionary) as! UserBaseInfoModel
        }
        
        set(userModel) {
            let userDefault = UserDefaults.standard
            userDefault.setValue(userModel.dictionary(), forKey: USER_DEFAULT_KEY_USER_INFO)
            userDefault.synchronize()
        }
    }
    
    func clearUser() {
        let userDefault = UserDefaults.standard
        userDefault.setValue(nil, forKey: USER_DEFAULT_KEY_USER_INFO)
        userDefault.synchronize()
    }
}
