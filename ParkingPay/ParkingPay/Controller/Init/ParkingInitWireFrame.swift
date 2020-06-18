//
//  ParkingInitWireFrame.swift
//  ParkingPay
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

class ParkingInitWireFrame: ParkingInitWireFrameProtocol {

    static func create(_ params: [String: Any]? = nil) -> UIViewController {
        let view = R.storyboard.parkingMain.parkingInitViewController()!
        let presenter = ParkingInitPresenter()
        let interactor = ParkingInitInteractor()

        view.presenter = presenter
        presenter.view = view
		presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
}
