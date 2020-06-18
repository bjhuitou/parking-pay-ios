//
//  ParkingOrderInfoProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingOrderInfoWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingOrderInfoViewProtocol: class {
    var presenter: ParkingOrderInfoPresenterProtocol? { get set }
    func isActive() -> Bool
}

protocol ParkingOrderInfoPresenterProtocol: class {
    var view: ParkingOrderInfoViewProtocol? { get set }
    func start()
    func stop()
}

protocol ParkingOrderInfoInteractorOutputProtocol: class {
    func didRetrieveData(_ data: String)
    func onError(_ error: String)
}

protocol ParkingOrderInfoInteractorInputProtocol: class {
    var presenter: ParkingOrderInfoInteractorOutputProtocol? { get set }
    func retrieveData()
}