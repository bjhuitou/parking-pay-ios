//
//  ParkingHomePresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingHomePresenter: ParkingHomePresenterProtocol {
    weak var view: ParkingHomeViewProtocol?
    var interactor: ParkingHomeInteractorInputProtocol?
    
    func start() {

    }

    func stop() {
    
    }
    
    func setCurrentPlate(_ plate: String) {
        self.view?.showCurrentPlate(plate)
    }
}

extension ParkingHomePresenter: ParkingHomeInteractorOutputProtocol {
    
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
