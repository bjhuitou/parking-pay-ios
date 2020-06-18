//
//  ParkingParkTableViewHeaderView.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit
import DTModelStorage

public class ParkingParkTableViewHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}

extension ParkingParkTableViewHeaderView: ModelTransfer {
    
    public func update(with model: String) {
        self.titleLabel.text = model
    }
}
