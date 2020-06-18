//
//  ParkingInitProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingInitWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingInitViewProtocol: class {
    var presenter: ParkingInitPresenterProtocol? { get set }
    func isActive() -> Bool
}

protocol ParkingInitPresenterProtocol: class {
    var view: ParkingInitViewProtocol? { get set }
    func start()
    func stop()
}

protocol ParkingInitInteractorOutputProtocol: class {
    func didRetrieveData(_ data: String)
    func onError(_ error: String)
}

protocol ParkingInitInteractorInputProtocol: class {
    var presenter: ParkingInitInteractorOutputProtocol? { get set }
    func retrieveData()
}