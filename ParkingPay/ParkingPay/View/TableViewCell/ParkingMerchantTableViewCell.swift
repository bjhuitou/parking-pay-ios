//
//  ParkingMerchantTableViewCell.swift
//  ParkingPay
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit
import DTModelStorage

public class ParkingMerchantTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ParkingMerchantTableViewCell: ModelTransfer {
    
    public func update(with model: String) {
        self.titleLabel.text = model
    }
}
