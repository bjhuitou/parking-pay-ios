//
//  ParkingMerchantsInteractor.swift
//  ParkingPay
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingMerchantsInteractor: ParkingMerchantsInteractorInputProtocol {
	weak var presenter: ParkingMerchantsInteractorOutputProtocol?

	func refreshData() {
        self.presenter?.didRefreshData(["AAAA", "BBBBB", "CCCC"])
    }
    
    func loadMoreData() {
        self.presenter?.didLoadMoreData(["DDDD", "EEEE", "FFFFF"])
    }
}
