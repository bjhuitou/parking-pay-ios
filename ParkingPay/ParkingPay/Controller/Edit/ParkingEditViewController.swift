//
//  ParkingEditViewController.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit
import SwiftEventBus

public class ParkingEditViewController: UIViewController {
    
    var presenter: ParkingEditPresenterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Init UI
    
    func initUI() {
    }
    
    // MARK: - Init Data
    
    func initData() {
        self.presenter?.start()
    }

    // MARK: - Action
    
    @IBAction func editAction() {
        self.presenter?.openEdit()
    }
    
    @IBAction func deleteAction() {
        self.presenter?.openDeleteConfirm()
    }
    
    @IBAction func previousAction() {

    }
    
    @IBAction func nextAction() {

    }
    
    @IBAction func infoAction() {
        self.presenter?.openInfo()
    }
    
    // MARK: - Private
}

extension ParkingEditViewController: ParkingEditViewProtocol {

    func isActive() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
    
    func showEdit(_ plate: String) {
        let alertController = UIAlertController(title: "", message: R.string.parkingLocalizable.editPlatePrompt(), preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: R.string.parkingLocalizable.cancel(), style: UIAlertAction.Style.cancel, handler: nil)
        let okAction = UIAlertAction(title: R.string.parkingLocalizable.save(), style: UIAlertAction.Style.default) {(action) in
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        alertController.addTextField { (textField) in
            textField.text = plate
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showInfo(_ plate: String) {
        SwiftEventBus.post("parkingEnterHome", sender: plate)
    }
    
    func showDeleteConfirm() {
        let alertController = UIAlertController(title: "", message: R.string.parkingLocalizable.deletePlateConfirm(), preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: R.string.parkingLocalizable.cancel(), style: UIAlertAction.Style.cancel, handler: nil)
        let okAction = UIAlertAction(title: R.string.parkingLocalizable.save(), style: UIAlertAction.Style.default) {(action) in
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
