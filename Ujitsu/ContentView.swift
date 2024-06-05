//
//  ContentView.swift
//  Ujitsu
//
//  Created by Виталий Вишняков on 14.05.2024.
//


import SwiftUI

struct ContentView: View {
    @StateObject var tabCoordinator: TabCoordinator
    
    var body: some View {
        TabView(selection: $tabCoordinator.selectedTab) {
            ForEach(tabCoordinator.tabItems) { screen in
                screen.destination
                    .tag(screen as Tab?)
                    .tabItem { screen.label }
            }
        }
        .environmentObject(tabCoordinator)
    }
}

#Preview {
    ContentView(tabCoordinator: TabCoordinator(deeplink: .ca))
}
