//
//  ParkingHomeViewController.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

public class ParkingHomeViewController: UIViewController {

    @IBOutlet weak var plateButton: UIButton!
    
    var presenter: ParkingHomePresenterProtocol?
    
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
    
    @IBAction func payAction() {
        let navigationController = UINavigationController(rootViewController: ParkingPayConfirmWireFrame.create())
        self.present(navigationController, animated: true)
    }
    
    @IBAction func parkingsAction() {
        let navigationController = UINavigationController(rootViewController: ParkingParkWireFrame.create())
        self.present(navigationController, animated: true)
    }
}

extension ParkingHomeViewController: ParkingHomeViewProtocol {

    func isActive() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
    
    func showCurrentPlate(_ plate: String) {
        self.plateButton.setTitle(plate, for: UIControl.State.normal)
    }
}

extension ParkingHomeViewController {
    
    open func setCurrentPlate(_ plate: String) {
        self.presenter?.setCurrentPlate(plate)
    }
}
