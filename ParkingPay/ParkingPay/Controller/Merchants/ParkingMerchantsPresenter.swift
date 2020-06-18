//
//  ParkingMerchantsPresenter.swift
//  ParkingPay
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingMerchantsPresenter: ParkingMerchantsPresenterProtocol {
    weak var view: ParkingMerchantsViewProtocol?
    var interactor: ParkingMerchantsInteractorInputProtocol?

    func start() {
        
    }

    func stop() {
    
    }
    
    func refreshData() {
        self.interactor?.refreshData()
    }
    
    func loadMoreData() {
        self.interactor?.loadMoreData()
    }
}

extension ParkingMerchantsPresenter: ParkingMerchantsInteractorOutputProtocol {
    
    func didRefreshData(_ data: [String]) {
        guard self.view?.isActive() == true else {
            return
        }
        
        self.view?.showRefreshData(data)
    }
    
    func didLoadMoreData(_ data: [String]) {
        guard self.view?.isActive() == true else {
            return
        }
        
        self.view?.showLoadMoreData(data)
    }
    
    func onError(_ error: String) {
        guard self.view?.isActive() == true else {
            return
        }
    }
}
