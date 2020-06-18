//
//  ParkingPaidViewController.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

public class ParkingPaidViewController: UIViewController {

    var presenter: ParkingPaidPresenterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Init UI
    
    func initUI() {

    }
    
    // MARK: - Init Data
    
    func initData() {
        self.presenter?.start()
    }

    // MARK: - Action
}

extension ParkingPaidViewController: ParkingPaidViewProtocol {

    func isActive() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
}
