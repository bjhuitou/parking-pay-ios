//
//  ParkingContactPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingContactPresenter: ParkingContactPresenterProtocol {
    weak var view: ParkingContactViewProtocol?
    var interactor: ParkingContactInteractorInputProtocol?

    func start() {

    }

    func stop() {
    
    }
}

extension ParkingContactPresenter: ParkingContactInteractorOutputProtocol {
    
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
