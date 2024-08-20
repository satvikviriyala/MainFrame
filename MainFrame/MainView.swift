//
//  MainView.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//


import Foundation
import SwiftUI

struct MainView: View {

    var body: some View {
        TabView {
            Text("Home View")
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            Text("Bookmarks View")
                .tabItem {
                    Label("Bookmarks", systemImage: "book")
                }

            Text("Chat View")
                .tabItem {
                    Label("Chat", systemImage: "message")
                }

            CommunitiesListView()
                .tabItem {
                    Label("Explore", systemImage: "globe")
                }
        }
    }
}

#Preview {
    MainView()
}
