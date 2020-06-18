//
//  ParkingPayConfirmWireFrame.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

class ParkingPayConfirmWireFrame: ParkingPayConfirmWireFrameProtocol {

    static func create(_ params: [String: Any]? = nil) -> UIViewController {
        let view = R.storyboard.parkingMain.parkingPayConfirmViewController()!
        let presenter = ParkingPayConfirmPresenter()
        let interactor = ParkingPayConfirmInteractor()

        view.presenter = presenter
        presenter.view = view
		presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
}
