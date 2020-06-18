//
//  ParkingPayConfirmViewController.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

public class ParkingPayConfirmViewController: UIViewController {

    var presenter: ParkingPayConfirmPresenterProtocol?
    
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
    
    @IBAction func closeAction() {
        self.dismiss(animated: true)
    }
}

extension ParkingPayConfirmViewController: ParkingPayConfirmViewProtocol {

    func isActive() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
}
