//
//  ParkingEditProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingEditWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingEditViewProtocol: class {
    var presenter: ParkingEditPresenterProtocol? { get set }
    func isActive() -> Bool
    func showEdit(_ plate: String)
    func showInfo(_ plate: String)
    func showDeleteConfirm()
}

protocol ParkingEditPresenterProtocol: class {
    var view: ParkingEditViewProtocol? { get set }
    func start()
    func stop()
    func openEdit()
    func openInfo()
    func openDeleteConfirm()
}

protocol ParkingEditInteractorOutputProtocol: class {
    func didRetrieveData(_ data: String)
    func onError(_ error: String)
}

protocol ParkingEditInteractorInputProtocol: class {
    var presenter: ParkingEditInteractorOutputProtocol? { get set }
    func retrieveData()
}
