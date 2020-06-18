//
//  ParkingContactProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingContactWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingContactViewProtocol: class {
    var presenter: ParkingContactPresenterProtocol? { get set }
    func isActive() -> Bool
}

protocol ParkingContactPresenterProtocol: class {
    var view: ParkingContactViewProtocol? { get set }
    func start()
    func stop()
}

protocol ParkingContactInteractorOutputProtocol: class {
    func didRetrieveData(_ data: String)
    func onError(_ error: String)
}

protocol ParkingContactInteractorInputProtocol: class {
    var presenter: ParkingContactInteractorOutputProtocol? { get set }
    func retrieveData()
}