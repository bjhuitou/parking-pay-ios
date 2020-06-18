//
//  ParkingParkViewController.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit
import SwiftEventBus

public class ParkingParkViewController: ParkingBaseTableViewController {

    var presenter: ParkingParkPresenterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
        initEvent()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Init UI
    
    func initUI() {
        initTableView()
    }
    
    func initTableView() {
        self.manager.registerHeader(ParkingParkTableViewHeaderView.self)
        self.manager.register(ParkingParkEmptyTableViewCell.self) { (mapping) in
            mapping.condition = .custom({ indexPath, model in
                if indexPath.section == 0 {
                    if let value = model as? String {
                        return value == "empty";
                    }
                }
                return false;
            })
        }
        self.manager.configureEvents(for: ParkingParkTableViewCell.self) { [weak self] cellType, modelType in
            manager.register(cellType) { (mapping) in
                mapping.condition = .custom({ indexPath, model in
                    if indexPath.section == 0 {
                       if let value = model as? String {
                           return value != "empty";
                       }
                    } else if indexPath.section == 1 {
                        return true
                    }
                    return false;
               })
            }
            manager.didSelect(cellType) { _, model, indexPath  in
                self?.tableView.deselectRow(at: indexPath, animated: false)
            }
        }
    }
    
    // MARK: - Init Data
    
    func initData() {
        self.presenter?.start()
        self.showLoadingView()
    }

    // MARK: - Action
    
    @IBAction func closeAction() {
        self.dismiss(animated: true)
    }
    
    // MARK: - Private
    
    func initEvent() {
        SwiftEventBus.onMainThread(self, name: "parkingRefreshParkLocation") {
            result in
            self.requestLocation()
        }
    }
    
    func requestLocation() {
        AHLocationManager.shared.startPositioning(self)
        AHLocationManager.shared.locationType = .WGS
        AHLocationManager.shared.postionUpdateClosure = {[weak self] (locModel) in
            if locModel.locationError != nil {
                // fail
            } else {
                if let coordinate = locModel.coordinate {
                    ParkingManage.shared.saveLocation(coordinate)
                }
            }
        }
    }
}

extension ParkingParkViewController: ParkingParkViewProtocol {

    func isActive() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
    
    func showData() {
        self.hideLoadingView()
        self.manager.memoryStorage.setSectionHeaderModels([R.string.parkingLocalizable.nearMe(), R.string.parkingLocalizable.councils()])
    }
    
    func showNearData(_ data: [String]) {
        self.manager.memoryStorage.removeItems(fromSection: 0)
        self.manager.memoryStorage.addItems(data, toSection: 0)
    }
    
    func showCouncilsData(_ data: [String]) {
        self.manager.memoryStorage.addItems(data, toSection: 1)
    }
    
    func showNearEmpty() {
        self.manager.memoryStorage.removeItems(fromSection: 0)
        self.manager.memoryStorage.addItems(["empty"], toSection: 0)
    }
}
