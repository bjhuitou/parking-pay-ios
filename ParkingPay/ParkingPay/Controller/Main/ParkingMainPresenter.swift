//
//  ParkingMainPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingMainPresenter: ParkingMainPresenterProtocol {
    weak var view: ParkingMainViewProtocol?
    var interactor: ParkingMainInteractorInputProtocol?

    func start() {

    }

    func stop() {
    
    }
}

extension ParkingMainPresenter: ParkingMainInteractorOutputProtocol {
    
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
