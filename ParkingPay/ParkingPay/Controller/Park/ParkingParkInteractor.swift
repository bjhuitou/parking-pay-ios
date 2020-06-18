//
//  ParkingParkInteractor.swift
//  ParkingPay
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation

class ParkingParkInteractor: ParkingParkInteractorInputProtocol {
	weak var presenter: ParkingParkInteractorOutputProtocol?
    
    func retrieveNearData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.didRetrieveNearData(["AAAA", "BBBBB", "CCCC"])
        }
    }
    
    func retrieveCouncilsData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.presenter?.didRetrieveCouncilsData(["DDDD", "EEEE", "FFFFF"])
        }
    }
}
