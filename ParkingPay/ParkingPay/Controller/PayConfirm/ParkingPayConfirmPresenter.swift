//
//  ParkingPayConfirmPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingPayConfirmPresenter: ParkingPayConfirmPresenterProtocol {
    weak var view: ParkingPayConfirmViewProtocol?
    var interactor: ParkingPayConfirmInteractorInputProtocol?

    func start() {

    }

    func stop() {
    
    }
}

extension ParkingPayConfirmPresenter: ParkingPayConfirmInteractorOutputProtocol {
    
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
