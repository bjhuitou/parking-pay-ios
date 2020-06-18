//
//  ParkingParkPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingParkPresenter: ParkingParkPresenterProtocol {
    
    weak var view: ParkingParkViewProtocol?
    var interactor: ParkingParkInteractorInputProtocol?

    func start() {
        getNear()
        getCouncils()
    }

    func stop() {
    
    }
    
    func getNear() {
        self.interactor?.retrieveNearData()
    }
    
    func getCouncils() {
        self.interactor?.retrieveCouncilsData()
    }
}

extension ParkingParkPresenter: ParkingParkInteractorOutputProtocol {
    
    func didRetrieveNearData(_ data: [String]) {
        guard self.view?.isActive() == true else {
            return
        }
        
        self.view?.showData()
        //self.view?.showNearData(data)
        self.view?.showNearEmpty()
    }
    
    func didRetrieveCouncilsData(_ data: [String]) {
        guard self.view?.isActive() == true else {
            return
        }
        
        self.view?.showData()
        self.view?.showCouncilsData(data)
    }
    
    func onError(_ error: String) {
        guard self.view?.isActive() == true else {
            return
        }
    }
}
