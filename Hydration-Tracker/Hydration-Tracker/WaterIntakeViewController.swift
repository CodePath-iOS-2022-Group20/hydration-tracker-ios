//
//  WaterIntakeViewController.swift
//  Hydration-Tracker
//
//  Created by Nguyễn Đương Quang on 10/30/22.
//

import UIKit

class WaterIntakeViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var increment: UIButton!
    
    @IBOutlet weak var decrement: UIButton!
    
    @IBOutlet weak var waterAmount: UILabel!
    
    var waterAmountInml: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onIncrementButton(_ sender: Any) {
        waterAmountInml += 50
        waterAmount.text = String(waterAmountInml) + "ml"
    }
    
    
    @IBAction func onDecrementButton(_ sender: Any) {
        waterAmountInml -= 50
        waterAmount.text = String(waterAmountInml) + "ml"
    }
    
    
    @IBAction func onSubmitButton(_ sender: Any) {
        self.dismiss(animated: true)
        
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
