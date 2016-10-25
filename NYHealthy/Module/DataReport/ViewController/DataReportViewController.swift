//
//  DataReportViewController.swift
//  NYHealthy
//
//  Created by NiYao on 5/16/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class DataReportViewController: UIViewController {

    @IBOutlet weak var dial: Dial!
    @IBOutlet weak var BMILable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.colorWithHex(COLOR_HEX_LIGHT_GRAY)
        self.BMILable.text = "Current:\(UserManager.sharedManager.user.currentWeight) Target:\(UserManager.sharedManager.user.targetWeight)"
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dial.backgroundColor = UIColor.clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.setNavigationBarHidden(true, animated: true)
        dial.drawCircle()
    }
   
    @IBAction func clear(_ sender: AnyObject) {
        ThemeManager.sharedManager().currentStyle = ThemeStyle.yellowStyle
        self.navigationController?.pushViewController(UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StoryboardIDTestController"), animated: true)
    }
    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var food: UITextField!
    @IBAction func insertWeightData(_ sender: AnyObject) {
    }
    
    @IBAction func insertFood(_ sender: AnyObject) {
        
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
