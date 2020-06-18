//
//  BaseDataTableViewController.swift
//  CloudMonitorUser
//
//  Created by apple on 2018/8/31.
//  Copyright © 2018年 yihe. All rights reserved.
//

import UIKit
import DTTableViewManager
import DTModelStorage
import TBEmptyDataSet

open class ParkingBaseTableViewController: UITableViewController, DTTableViewManageable {

    var emptyDataSetShouldDisplay: Bool = false
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ParkingBaseTableViewController: TBEmptyDataSetDataSource, TBEmptyDataSetDelegate {
    
    func initDelegate() {
        guard self.tableView.emptyDataSetDelegate != nil else {
            self.tableView.emptyDataSetDelegate = self
            self.tableView.emptyDataSetDataSource = self
            return 
        }
    }
    
    public func showEmptyView() {
        initDelegate()
        self.emptyDataSetShouldDisplay = true
        self.tableView.reloadData()
    }
    
    public func showContentView() {
        initDelegate()
        self.emptyDataSetShouldDisplay = false
        self.tableView.reloadData()
    }
    
    public func titleForEmptyDataSet(in scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: R.string.parkingLocalizable.noData())
    }
    
    public func emptyDataSetShouldDisplay(in scrollView: UIScrollView) -> Bool {
        return emptyDataSetShouldDisplay
    }
    
    public func emptyDataSetDidTapEmptyView(in scrollView: UIScrollView) {
    }
}
