//
//  ParkingParkingsPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingParkingsPresenter: ParkingParkingsPresenterProtocol {
    weak var view: ParkingParkingsViewProtocol?
    var interactor: ParkingParkingsInteractorInputProtocol?

    func start() {

    }

    func stop() {
    
    }
}

extension ParkingParkingsPresenter: ParkingParkingsInteractorOutputProtocol {
    
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
