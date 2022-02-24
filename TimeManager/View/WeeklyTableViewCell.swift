//
//  WeeklyTableViewCell.swift
//  TimeManager
//
//  Created by Amardeep on 27/01/22.
//  Copyright © 2022 Amardeep. All rights reserved.
//

import UIKit

class WeeklyTableViewCell: UITableViewCell {

    @IBOutlet weak var weeklyDatesLabel: UILabel!
    
    @IBOutlet weak var weeklyOvertimeLabel: UILabel!
    
    @IBOutlet weak var openCloseImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
