//
//  ParkingMerchantsProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingMerchantsWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingMerchantsViewProtocol: class {
    var presenter: ParkingMerchantsPresenterProtocol? { get set }
    func isActive() -> Bool
    func showRefreshData(_ data: [String])
    func showLoadMoreData(_ data: [String])
    func showEmpty()
}

protocol ParkingMerchantsPresenterProtocol: class {
    var view: ParkingMerchantsViewProtocol? { get set }
    func start()
    func stop()
    func refreshData()
    func loadMoreData()
}

protocol ParkingMerchantsInteractorOutputProtocol: class {
    func didRefreshData(_ data: [String])
    func didLoadMoreData(_ data: [String])
    func onError(_ error: String)
}

protocol ParkingMerchantsInteractorInputProtocol: class {
    var presenter: ParkingMerchantsInteractorOutputProtocol? { get set }
    func refreshData()
    func loadMoreData()
}
