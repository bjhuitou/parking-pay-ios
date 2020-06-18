//
//  ParkingPayConfirmProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingPayConfirmWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingPayConfirmViewProtocol: class {
    var presenter: ParkingPayConfirmPresenterProtocol? { get set }
    func isActive() -> Bool
}

protocol ParkingPayConfirmPresenterProtocol: class {
    var view: ParkingPayConfirmViewProtocol? { get set }
    func start()
    func stop()
}

protocol ParkingPayConfirmInteractorOutputProtocol: class {
    func didRetrieveData(_ data: String)
    func onError(_ error: String)
}

protocol ParkingPayConfirmInteractorInputProtocol: class {
    var presenter: ParkingPayConfirmInteractorOutputProtocol? { get set }
    func retrieveData()
}