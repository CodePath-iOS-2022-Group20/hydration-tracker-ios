//
//  StatsCell.swift
//  Hydration-Tracker
//
//  Created by Abdullah Baghdadi on 10/28/22.
//

import UIKit

class StatsCell: UITableViewCell {

    @IBOutlet weak var statLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
