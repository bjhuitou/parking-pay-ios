//
//  ParkingMainWireFrame.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

class ParkingMainWireFrame: ParkingMainWireFrameProtocol {

    static func create(_ params: [String: Any]? = nil) -> UIViewController {
        let view = R.storyboard.parkingMain.parkingMainViewController()!
        let presenter = ParkingMainPresenter()
        let interactor = ParkingMainInteractor()

        view.presenter = presenter
        presenter.view = view
		presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
}
