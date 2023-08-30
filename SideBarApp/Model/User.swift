//
//  User.swift
//  SideBarApp
//
//  Created by Antoine Omnès on 30/08/2023.
//

import Foundation

class User: Identifiable, Codable {
    var id: Int
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
}
