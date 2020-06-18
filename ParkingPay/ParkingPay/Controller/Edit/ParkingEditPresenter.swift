//
//  ParkingEditPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingEditPresenter: ParkingEditPresenterProtocol {
    weak var view: ParkingEditViewProtocol?
    var interactor: ParkingEditInteractorInputProtocol?

    func start() {

    }

    func stop() {
    
    }
    
    func openEdit() {
        self.view?.showEdit("")
    }
    
    func openInfo() {
        self.view?.showInfo("aaa")
    }
    
    func openDeleteConfirm() {
        self.view?.showDeleteConfirm()
    }
}

extension ParkingEditPresenter: ParkingEditInteractorOutputProtocol {
    
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
