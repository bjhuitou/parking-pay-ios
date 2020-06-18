//
//  ParkingRfidProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingRfidWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingRfidViewProtocol: class {
    var presenter: ParkingRfidPresenterProtocol? { get set }
    func isActive() -> Bool
}

protocol ParkingRfidPresenterProtocol: class {
    var view: ParkingRfidViewProtocol? { get set }
    func start()
    func stop()
}

protocol ParkingRfidInteractorOutputProtocol: class {
    func didRetrieveData(_ data: String)
    func onError(_ error: String)
}

protocol ParkingRfidInteractorInputProtocol: class {
    var presenter: ParkingRfidInteractorOutputProtocol? { get set }
    func retrieveData()
}