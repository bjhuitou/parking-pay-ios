//
//  ParkingParkingsWireFrame.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

class ParkingParkingsWireFrame: ParkingParkingsWireFrameProtocol {

    static func create(_ params: [String: Any]? = nil) -> UIViewController {
        let view = R.storyboard.parkingMain.parkingParkingsViewController()!
        let presenter = ParkingParkingsPresenter()
        let interactor = ParkingParkingsInteractor()

        view.presenter = presenter
        presenter.view = view
		presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
}
