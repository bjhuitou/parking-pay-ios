//
//  ParkingInitViewController.swift
//  ParkingPay
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

public class ParkingInitViewController: PresentBottomVC {

    var presenter: ParkingInitPresenterProtocol?
    
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

extension ParkingInitViewController: ParkingInitViewProtocol {

    func isActive() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
}
