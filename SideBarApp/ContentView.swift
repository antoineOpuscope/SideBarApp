//
//  ContentView.swift
//  SideBarApp
//
//  Created by Antoine Omnès on 29/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedUserId: Int?
    @EnvironmentObject var stateController: StateController
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedUserId) {
                ForEach(stateController.users) { user in
                    Text(user.username ?? "")
                }
            }
        } detail: {
            if let selectedUserId, let user = stateController.users.first(where: {$0.id == selectedUserId}) {
                Group {
                    Text(user.name ?? "")
                    Text(user.username ?? "")
                    Text(user.website ?? "")
                    Text(user.email ?? "")
                }.padding()
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .blendMode(.colorBurn)
                
            }
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

