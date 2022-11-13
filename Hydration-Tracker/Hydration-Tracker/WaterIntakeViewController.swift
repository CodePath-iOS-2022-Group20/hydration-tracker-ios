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
    
    @IBOutlet weak var addOrLowerSelection: UISegmentedControl!
    @IBOutlet weak var waterAmountLabel: UILabel!
    @IBOutlet weak var waterAmountField: UITextField!
    @IBOutlet weak var waterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let water = user?["daily_water"]
        waterAmountLabel.text = ("\(water ?? "nil")") + "mL"
        let login_date = Date().formatted(date: .complete, time: .omitted)
        
        if login_date != user?["last_login"] as! String {
            let daily_water = user?["daily_water"] as! Int
            if daily_water >= user?["water_goal"] as! Int {
                user?["streak"] = user?["streak"] as! Int + 1
            } else {
                user?["streak"] = 0
            }
            user?["total_water"] = user!["total_water"] as! Int + daily_water
            user?["daily_water"] = 0
            user?.saveInBackground()
            waterAmountLabel.text = "0 mL"
            user?["last_login"] = login_date
        }
        
        let goal = user?["water_goal"]
        
        var fadeAnim: CABasicAnimation = CABasicAnimation(keyPath: "contents")
        
        if water as! Int >= goal as! Int {
            fadeAnim.fromValue = waterImage
            fadeAnim.toValue = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
            fadeAnim.duration = 0.8
            waterImage.layer.add(fadeAnim, forKey: "contents")
            
            waterImage.image = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        var fadeAnim: CABasicAnimation = CABasicAnimation(keyPath: "contents")

        let water = user?["daily_water"]
        let goal = user?["water_goal"]
        
        if addOrLowerSelection.selectedSegmentIndex == 0 {
            let waterAmountText = waterAmountField.text ?? ""
            let waterAmount = Int(waterAmountText) ?? 0
            user?["daily_water"] = user?["daily_water"] as! Int + waterAmount
            user?.saveInBackground()
            waterAmountLabel.text = ("\(water ?? "nil")") + "mL"
            
            if water as! Int >= goal as! Int {
                fadeAnim.fromValue = waterImage
                fadeAnim.toValue = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
                fadeAnim.duration = 0.8
                waterImage.layer.add(fadeAnim, forKey: "contents")
                
                waterImage.image = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
            }
        }
        
        if addOrLowerSelection.selectedSegmentIndex == 1 {
            let waterAmountText = waterAmountField.text ?? ""
            let waterAmount = Int(waterAmountText) ?? 0
            user?["daily_water"] = user?["daily_water"] as! Int - waterAmount
            user?.saveInBackground()
            let water = user?["daily_water"]
            waterAmountLabel.text = ("\(water ?? "nil")") + "mL"
            
            if  goal as! Int > water as! Int{
                fadeAnim.fromValue = waterImage
                fadeAnim.toValue = UIImage(systemName: "takeoutbag.and.cup.and.straw")
                fadeAnim.duration = 0.8
                waterImage.layer.add(fadeAnim, forKey: "contents")
                
                waterImage.image = UIImage(systemName: "takeoutbag.and.cup.and.straw")
            }
        }
        
        

    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window?.rootViewController = loginViewController
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
