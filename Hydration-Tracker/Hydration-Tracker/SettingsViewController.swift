//
//  SettingsViewController.swift
//  Hydration-Tracker
//
//  Created by Ahmed Mohammed on 11/1/22.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {
    @IBOutlet weak var changeGoal: UILabel!
    @IBOutlet weak var changeGoalField: UITextField!
    @IBOutlet var notifications: UIView!
    @IBOutlet weak var notiSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        let user = PFUser()
        user["water_goal"] = changeGoalField.text
        print(user["water_goal"])
    }
    
    
    
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
