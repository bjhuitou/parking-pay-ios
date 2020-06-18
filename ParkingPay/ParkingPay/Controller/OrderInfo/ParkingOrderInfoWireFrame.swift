//
//  ParkingOrderInfoWireFrame.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

class ParkingOrderInfoWireFrame: ParkingOrderInfoWireFrameProtocol {

    static func create(_ params: [String: Any]? = nil) -> UIViewController {
        let view = R.storyboard.parkingMain.parkingOrderInfoViewController()!
        let presenter = ParkingOrderInfoPresenter()
        let interactor = ParkingOrderInfoInteractor()

        view.presenter = presenter
        presenter.view = view
		presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
}
