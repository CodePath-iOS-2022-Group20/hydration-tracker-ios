//
//  StatsViewController.swift
//  Hydration-Tracker
//
//  Created by Abdullah Baghdadi on 11/13/22.
//

import UIKit
import Parse

class StatsViewController: UIViewController {
    
    let user = PFUser.current()
    
    
    @IBOutlet weak var streakLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let streak = user?["streak"]
        streakLabel.text = ("\(streak ?? "nil")") + " days"
        let total = user?["total_water"]
        totalLabel.text = ("\(total ?? "nil")") + "mL"
        let goal = user?["water_goal"]
        goalLabel.text = ("\(goal ?? "nil")") + "mL"
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
