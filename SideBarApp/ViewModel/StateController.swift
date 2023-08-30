//
//  StateController.swift
//  SideBarApp
//
//  Created by Antoine Omnès on 30/08/2023.
//

import Foundation

import Foundation
import CoreLocation
import SwiftUI

@MainActor
class StateController: ObservableObject {
    
    @Published var users: [User] = []
    
    // TODO: create a list location in StateController and Project will contains only locations Ids
    
    private let storageController = StorageController()
    
    init() {}
    
    func setup() async {
        let loadedUsers = await storageController.fetchUser()
        self.users = loadedUsers
        print(self.users.count)
    }
}
