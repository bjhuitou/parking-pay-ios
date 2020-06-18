//
//  ParkingParkingsViewController.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

public class ParkingParkingsViewController: UIViewController {

    var presenter: ParkingParkingsPresenterProtocol?
    
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
    
    @IBAction func allMerchantsAction() {
        let params = ["title": R.string.parkingLocalizable.allMerchants()]
        let navigationController = UINavigationController(rootViewController: ParkingMerchantsWireFrame.create(params))
        self.present(navigationController, animated: true)
    }
    
    @IBAction func shoppingMallAction() {
        let params = ["title": R.string.parkingLocalizable.shoppingMall()]
        let navigationController = UINavigationController(rootViewController: ParkingMerchantsWireFrame.create(params))
        self.present(navigationController, animated: true)
    }
    
    @IBAction func commercialAction() {
        let params = ["title": R.string.parkingLocalizable.commercial()]
        let navigationController = UINavigationController(rootViewController: ParkingMerchantsWireFrame.create(params))
        self.present(navigationController, animated: true)
    }
    
    @IBAction func residentialAction() {
        let params = ["title": R.string.parkingLocalizable.residential()]
        let navigationController = UINavigationController(rootViewController: ParkingMerchantsWireFrame.create(params))
        self.present(navigationController, animated: true)
    }
}

extension ParkingParkingsViewController: ParkingParkingsViewProtocol {

    func isActive() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
}
