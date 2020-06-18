//
//  ParkingParkProtocol.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

protocol ParkingParkWireFrameProtocol: class {
    static func create(_ params: [String: Any]?) -> UIViewController
}

protocol ParkingParkViewProtocol: class {
    var presenter: ParkingParkPresenterProtocol? { get set }
    func isActive() -> Bool
    func showData()
    func showNearData(_ data: [String])
    func showCouncilsData(_ data: [String])
    func showNearEmpty()
}

protocol ParkingParkPresenterProtocol: class {
    var view: ParkingParkViewProtocol? { get set }
    func start()
    func stop()
    func getNear()
    func getCouncils();
}

protocol ParkingParkInteractorOutputProtocol: class {
    func didRetrieveNearData(_ data: [String])
    func didRetrieveCouncilsData(_ data: [String])
    func onError(_ error: String)
}

protocol ParkingParkInteractorInputProtocol: class {
    var presenter: ParkingParkInteractorOutputProtocol? { get set }
    func retrieveNearData()
    func retrieveCouncilsData()
}
