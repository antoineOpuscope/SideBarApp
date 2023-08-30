//
//  ContentView.swift
//  SideBarApp
//
//  Created by Antoine Omnès on 29/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var stateController: StateController
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(stateController.users) { user in
                    Text(user.username ?? "")
                }
            }
        } content: {
          // Sub menu
        } detail: {
          // Detail view for each of the sub-menu item
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    struct Preview: View {
        
        @StateObject var stateController = StateController()

        var body: some View {
            ContentView()
                .environmentObject(stateController)
                .task {
                    await stateController.setup()
                }
        }
    }

    static var previews: some View {
        Preview()
    }
}

