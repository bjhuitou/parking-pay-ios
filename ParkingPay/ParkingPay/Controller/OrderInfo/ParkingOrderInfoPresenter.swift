//
//  ParkingOrderInfoPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingOrderInfoPresenter: ParkingOrderInfoPresenterProtocol {
    weak var view: ParkingOrderInfoViewProtocol?
    var interactor: ParkingOrderInfoInteractorInputProtocol?

    func start() {

    }

    func stop() {
    
    }
}

extension ParkingOrderInfoPresenter: ParkingOrderInfoInteractorOutputProtocol {
    
    func didRetrieveData(_ data: String) {
        guard self.view?.isActive() == true else {
            return
        }
    }
    
    func onError(_ error: String) {
        guard self.view?.isActive() == true else {
            return
        }
    }
}
