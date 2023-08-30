//
//  Address.swift
//  SideBarApp
//
//  Created by Antoine Omnès on 30/08/2023.
//

import CoreLocation

class Address: Codable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
}
