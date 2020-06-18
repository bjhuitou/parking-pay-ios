//
//  ParkingMerchantsWireFrame.swift
//  ParkingPay
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 wavpay. All rights reserved.
//

import UIKit

class ParkingMerchantsWireFrame: ParkingMerchantsWireFrameProtocol {

    static func create(_ params: [String: Any]? = nil) -> UIViewController {
        let view = R.storyboard.parkingMain.parkingMerchantsViewController()!
        let presenter = ParkingMerchantsPresenter()
        let interactor = ParkingMerchantsInteractor()

        view.presenter = presenter
        presenter.view = view
		presenter.interactor = interactor
        interactor.presenter = presenter

        view.customTitle = params?["title"] as? String
        
        return view
    }
}
