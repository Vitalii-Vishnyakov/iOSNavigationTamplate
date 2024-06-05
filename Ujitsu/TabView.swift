//
//  TabView.swift
//  Ujitsu
//
//  Created by Виталий Вишняков on 14.05.2024.
//

import SwiftUI

struct HomeNavigationStack: View {
    @StateObject var coordinator = HomeCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.homePath) {
            Button("Open train") {
                coordinator.push(next: .train)
            }.navigationDestination(for: HomeRoute.self) { route in
                if case .train = route {
                    NewPageView(viewModel: NewPageViewModel(coordinator: coordinator))
                }
            }
        }
        .environmentObject(coordinator)
    }
}

struct DiscoverNavigationStack: View {
    @StateObject var coordinator = DiscoverCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.discoverPath) {
            Text("Big title")
        }
        .environmentObject(coordinator)
    }
}

struct StoreNavigationStack: View {
    @StateObject var coordinator = StoreCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.storePath) {
            Text("Big title")
        }
        .environmentObject(coordinator)
    }
}

struct MeNavigationStack: View {
    @StateObject var coordinator = MeCoordinator()
    @EnvironmentObject var tabCoordinator: TabCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.mePath) {
            Button("Go home") {
                tabCoordinator.selectTab(tab: .home)
            }
        }
        .environmentObject(coordinator)
    }
}

enum DeepLink: Hashable, CaseIterable {
    // case ,var
    case ca
    case none
}
