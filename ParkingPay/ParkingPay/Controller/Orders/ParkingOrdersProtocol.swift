//
//  ParkingOrdersProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingOrdersWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingOrdersViewProtocol: class {
    var presenter: ParkingOrdersPresenterProtocol? { get set }
    func isActive() -> Bool
    func showRefreshData(_ data: [String])
    func showLoadMoreData(_ data: [String])
    func showEmpty()
}

protocol ParkingOrdersPresenterProtocol: class {
    var view: ParkingOrdersViewProtocol? { get set }
    func start()
    func stop()
    func refreshData()
    func loadMoreData()
}

protocol ParkingOrdersInteractorOutputProtocol: class {
    func didRefreshData(_ data: [String])
    func didLoadMoreData(_ data: [String])
    func onError(_ error: String)
}

protocol ParkingOrdersInteractorInputProtocol: class {
    var presenter: ParkingOrdersInteractorOutputProtocol? { get set }
    func refreshData()
    func loadMoreData()
}
