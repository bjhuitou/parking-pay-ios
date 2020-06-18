//
//  ParkingMainProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingMainWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingMainViewProtocol: class {
    var presenter: ParkingMainPresenterProtocol? { get set }
    func isActive() -> Bool
}

protocol ParkingMainPresenterProtocol: class {
    var view: ParkingMainViewProtocol? { get set }
    func start()
    func stop()
}

protocol ParkingMainInteractorOutputProtocol: class {
    func didRetrieveData(_ data: String)
    func onError(_ error: String)
}

protocol ParkingMainInteractorInputProtocol: class {
    var presenter: ParkingMainInteractorOutputProtocol? { get set }
    func retrieveData()
}