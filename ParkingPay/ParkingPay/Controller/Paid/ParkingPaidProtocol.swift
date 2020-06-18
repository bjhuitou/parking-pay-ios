//
//  ParkingPaidProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingPaidWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingPaidViewProtocol: class {
    var presenter: ParkingPaidPresenterProtocol? { get set }
    func isActive() -> Bool
}

protocol ParkingPaidPresenterProtocol: class {
    var view: ParkingPaidViewProtocol? { get set }
    func start()
    func stop()
}

protocol ParkingPaidInteractorOutputProtocol: class {
    func didRetrieveData(_ data: String)
    func onError(_ error: String)
}

protocol ParkingPaidInteractorInputProtocol: class {
    var presenter: ParkingPaidInteractorOutputProtocol? { get set }
    func retrieveData()
}