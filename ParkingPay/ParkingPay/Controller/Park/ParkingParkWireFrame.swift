//
//  ParkingParkWireFrame.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

class ParkingParkWireFrame: ParkingParkWireFrameProtocol {

    static func create(_ params: [String: Any]? = nil) -> UIViewController {
        let view = R.storyboard.parkingMain.parkingParkViewController()!
        let presenter = ParkingParkPresenter()
        let interactor = ParkingParkInteractor()

        view.presenter = presenter
        presenter.view = view
		presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
}
