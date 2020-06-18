//
//  ParkingParkEmptyTableViewCell.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit
import DTModelStorage
import SwiftEventBus

public class ParkingParkEmptyTableViewCell: UITableViewCell {

    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func refreshAction() {
        SwiftEventBus.post("parkingRefreshParkLocation")
    }
}

extension ParkingParkEmptyTableViewCell: ModelTransfer {
    
    public func update(with model: String) {
    }
}
