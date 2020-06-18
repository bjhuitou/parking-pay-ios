//
//  ParkingManage.swift
//  ParkingPay
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 wavpay. All rights reserved.
//

import Foundation
import CoreLocation

class ParkingManage {
    
    static let parkingLatKey = "parking_lat"
    static let parkingLonKey = "parking_lon"
    
    static let shared = ParkingManage()
    private init() {}
    
    func saveLocation(_ location: CLLocationCoordinate2D) {
        UserDefaults.standard.set(location.latitude, forKey: ParkingManage.parkingLatKey)
        UserDefaults.standard.set(location.longitude, forKey: ParkingManage.parkingLonKey)
    }
    
    func getLocation() -> CLLocationCoordinate2D? {
        if let lat = UserDefaults.standard.value(forKey: ParkingManage.parkingLatKey)
            , let lon = UserDefaults.standard.value(forKey: ParkingManage.parkingLonKey) {
            return CLLocationCoordinate2D(latitude: lat as! CLLocationDegrees, longitude: lon as! CLLocationDegrees)
        }
        
        return nil
    }
}

extension ParkingManage {
}
