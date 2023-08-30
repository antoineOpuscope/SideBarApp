//
//  ContentView.swift
//  SideBarApp
//
//  Created by Antoine Omnès on 29/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
          List {
            Label("About", systemImage: "info.circle")
            Label("Settings", systemImage: "gear")
          }
          .listStyle(SidebarListStyle())
        }
    }
}

#Preview {
    ContentView()
}
