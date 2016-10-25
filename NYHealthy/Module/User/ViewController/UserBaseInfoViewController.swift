//
//  UserBaseInfoViewController.swift
//  NYHealthy
//
//  Created by NiYao on 5/19/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class UserBaseInfoViewController: UIViewController {

    @IBOutlet weak var currentWeight: UITextField!
    @IBOutlet weak var targetWeight: UITextField!
    @IBOutlet weak var height: UITextField!
    
    var isFemale:Bool = false
    
    override func viewDidLoad() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func isFemale(_ sender: UISwitch) {
        isFemale = sender.isOn
    }

    @IBAction func clearUserInfo(_ sender: AnyObject) {
        UserManager.sharedManager.clearUser()
    }
    @IBAction func completeUserInfo(_ sender: AnyObject) {
       
        let user = UserBaseInfoModel()
        user.UDID = NSObject.getUUID()
        user.currentWeight = Double(self.currentWeight.text!)!
        user.targetWeight = Double(self.targetWeight.text!)!
        user.height = Double(self.height.text!)!
        user.isMale = !isFemale
        UserManager.sharedManager.user = user
        
        let mainVC:UIViewController = controllerForID(STORYBOARD_ID_TAB_BAR_CONTROLLER)
        let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        delegate.switchRootViewControllerTo(mainVC)
    }
    
    @IBAction func tapBackground(_ sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
