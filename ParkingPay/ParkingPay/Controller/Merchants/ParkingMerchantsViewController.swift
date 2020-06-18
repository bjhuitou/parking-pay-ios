//
//  ParkingMerchantsViewController.swift
//  ParkingPay
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit
import MJRefresh

public class ParkingMerchantsViewController: ParkingBaseTableViewController {

    var presenter: ParkingMerchantsPresenterProtocol?
    var customTitle: String!
    
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
        self.navigationItem.title = self.customTitle
        initTableView()
    }
    
    func initTableView() {
        self.manager.configureEvents(for: ParkingMerchantTableViewCell.self) { [weak self] cellType, modelType in
            manager.register(cellType)
            manager.didSelect(cellType) { _, model, indexPath  in
            }
        }
        
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.presenter?.refreshData()
        })
        self.tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            self.presenter?.loadMoreData()
        })
    }
    
    // MARK: - Init Data
    
    func initData() {
        self.tableView?.mj_header.beginRefreshing()
    }

    // MARK: - Action
    
    @IBAction func closeAction() {
        self.dismiss(animated: true)
    }
}

extension ParkingMerchantsViewController: ParkingMerchantsViewProtocol {

    func isActive() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
    
    func showRefreshData(_ data: [String]) {
        self.manager.memoryStorage.removeAllItems()
        self.manager.memoryStorage.addItems(data)
        self.tableView.mj_header.endRefreshing()
    }
    
    func showLoadMoreData(_ data: [String]) {
        self.manager.memoryStorage.addItems(data)
        self.tableView.mj_footer.endRefreshing()
    }
    
    func showEmpty() {
        self.tableView.mj_header.endRefreshing()
        self.tableView.mj_footer.endRefreshing()
//        showErrorView(withMessage: IgSDK.R.string.gLocalizable.noData()) {
//            self.initData()
//        }
    }
}
