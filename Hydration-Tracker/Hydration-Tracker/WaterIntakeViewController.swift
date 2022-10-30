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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        var current_water = user?["daily_water"] as! Int
        var new_water = current_water + 50
        user?.setValue(new_water, forKey: "daily_water")
        
//        switch addOrLowerSelection.selectedSegmentIndex {
//        case 0:
//            user["daily_water"] +=
//        case 1:
//        }
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
