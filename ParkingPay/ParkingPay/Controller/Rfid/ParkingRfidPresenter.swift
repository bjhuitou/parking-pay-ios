//
//  ParkingRfidPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingRfidPresenter: ParkingRfidPresenterProtocol {
    weak var view: ParkingRfidViewProtocol?
    var interactor: ParkingRfidInteractorInputProtocol?

    func start() {

    }

    func stop() {
    
    }
}

extension ParkingRfidPresenter: ParkingRfidInteractorOutputProtocol {
    
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
