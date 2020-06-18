//
//  ParkingHomeProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingHomeWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingHomeViewProtocol: class {
    var presenter: ParkingHomePresenterProtocol? { get set }
    func isActive() -> Bool
    func showCurrentPlate(_ plate: String)
}

protocol ParkingHomePresenterProtocol: class {
    var view: ParkingHomeViewProtocol? { get set }
    func start()
    func stop()
    func setCurrentPlate(_ plate: String)
}

protocol ParkingHomeInteractorOutputProtocol: class {
    func didRetrieveData(_ data: String)
    func onError(_ error: String)
}

protocol ParkingHomeInteractorInputProtocol: class {
    var presenter: ParkingHomeInteractorOutputProtocol? { get set }
    func retrieveData()
}
