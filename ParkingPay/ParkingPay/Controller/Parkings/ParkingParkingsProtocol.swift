//
//  ParkingParkingsProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingParkingsWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingParkingsViewProtocol: class {
    var presenter: ParkingParkingsPresenterProtocol? { get set }
    func isActive() -> Bool
}

protocol ParkingParkingsPresenterProtocol: class {
    var view: ParkingParkingsViewProtocol? { get set }
    func start()
    func stop()
}

protocol ParkingParkingsInteractorOutputProtocol: class {
    func didRetrieveData(_ data: String)
    func onError(_ error: String)
}

protocol ParkingParkingsInteractorInputProtocol: class {
    var presenter: ParkingParkingsInteractorOutputProtocol? { get set }
    func retrieveData()
}