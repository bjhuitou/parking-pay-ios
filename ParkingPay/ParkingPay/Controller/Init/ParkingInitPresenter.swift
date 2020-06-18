//
//  ParkingInitPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingInitPresenter: ParkingInitPresenterProtocol {
    weak var view: ParkingInitViewProtocol?
    var interactor: ParkingInitInteractorInputProtocol?

    func start() {

    }

    func stop() {
    
    }
}

extension ParkingInitPresenter: ParkingInitInteractorOutputProtocol {
    
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
