//
//  ParkingPaidPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingPaidPresenter: ParkingPaidPresenterProtocol {
    weak var view: ParkingPaidViewProtocol?
    var interactor: ParkingPaidInteractorInputProtocol?

    func start() {

    }

    func stop() {
    
    }
}

extension ParkingPaidPresenter: ParkingPaidInteractorOutputProtocol {
    
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
