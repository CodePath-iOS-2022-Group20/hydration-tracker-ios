//
//  StatsViewController.swift
//  Hydration-Tracker
//
//  Created by Abdullah Baghdadi on 10/28/22.
//

import UIKit

class StatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var statsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        statsTableView.dataSource = self
        statsTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = statsTableView.dequeueReusableCell(withIdentifier: "StatsCell") as! StatsCell

        cell.statLabel.text = "section: \(indexPath.section)"
        cell.valueLabel.text = "row: \(indexPath.row)"
        
        return cell
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
