//
//  ParkingOrderTableViewCell.swift
//  ParkingPay
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit
import DTModelStorage

public class ParkingOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var balLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension ParkingOrderTableViewCell: ModelTransfer {
    
    public func update(with model: String) {
        
    }
}
