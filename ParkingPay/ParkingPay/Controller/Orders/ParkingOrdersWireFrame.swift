//
//  ParkingOrdersWireFrame.swift
//  ParkingPay
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

class ParkingOrdersWireFrame: ParkingOrdersWireFrameProtocol {

    static func create(_ params: [String: Any]? = nil) -> UIViewController {
        let view = R.storyboard.parkingMain.parkingOrdersViewController()!
        let presenter = ParkingOrdersPresenter()
        let interactor = ParkingOrdersInteractor()

        view.presenter = presenter
        presenter.view = view
		presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
}
