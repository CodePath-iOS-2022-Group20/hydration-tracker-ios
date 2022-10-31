//
//  WaterIntakeViewController.swift
//  Hydration-Tracker
//
//  Created by Abdullah Baghdadi on 10/30/22.
//

import UIKit
import Parse

class WaterIntakeViewController: UIViewController {
    
    let user = PFUser.current()
    
    @IBOutlet weak var waterAmountField: UITextField!
    @IBOutlet weak var addOrLowerSelection: UISegmentedControl!
    @IBOutlet weak var waterAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let water = user?["daily_water"]
        waterAmountLabel.text = ("\(water ?? "nil")") + "mL"
        let login_date = String(Date().formatted(date: .complete, time: .complete))
        if login_date != user?["last_login"] as! String {
            user?["last_login"] = login_date
            var daily_water = user?["daily_water"] as! Int
            if daily_water == user?["water_goal"] as! Int{
                user?["streak"] = user?["streak"] as! Int + 1
            } else {
                user?["streak"] = 0
            }
            user?["total_water"] = user!["total_water"] as! Int + daily_water
            user?["daily_water"] = 0
            user?.saveInBackground()
            waterAmountLabel.text = "0 mL"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        if addOrLowerSelection.selectedSegmentIndex == 0 {
            let waterAmountText = waterAmountField.text ?? ""
            let waterAmount = Int(waterAmountText) ?? 0
            user?["daily_water"] = user?["daily_water"] as! Int + waterAmount
            user?.saveInBackground()
            let water = user?["daily_water"]
            waterAmountLabel.text = ("\(water ?? "nil")") + "mL"
        }
        
        if addOrLowerSelection.selectedSegmentIndex == 1 {
            let waterAmountText = waterAmountField.text ?? ""
            let waterAmount = Int(waterAmountText) ?? 0
            user?["daily_water"] = user?["daily_water"] as! Int - waterAmount
            user?.saveInBackground()
            let water = user?["daily_water"]
            waterAmountLabel.text = ("\(water ?? "nil")") + "mL"
        }
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
