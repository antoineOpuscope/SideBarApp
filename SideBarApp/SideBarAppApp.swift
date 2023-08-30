//
//  SideBarAppApp.swift
//  SideBarApp
//
//  Created by Antoine Omnès on 29/08/2023.
//

import SwiftUI

@main
struct SideBarAppApp: App {
    
    @StateObject private var stateController: StateController = StateController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    await stateController.setup()
                }
                .environmentObject(stateController)
            
        }
    }
}
