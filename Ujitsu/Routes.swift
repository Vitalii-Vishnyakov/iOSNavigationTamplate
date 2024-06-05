//
//  Routes.swift
//  Ujitsu
//
//  Created by Виталий Вишняков on 14.05.2024.
//

import Foundation
import SwiftUI

enum HomeRoute: Hashable {
    case home
    case detail
    case train
}

enum DiscoverRoute: Hashable {
    case discover
}

enum StoreRoute: Hashable {
    case store
}

enum MeRoute: Hashable {
    case profile
    case editProfile
}

enum Tab: Hashable, Identifiable {
    case home
    case discover(DeepLink)
    case store
    case profile
    
    var id: Tab { self }
}

extension Tab {
    @ViewBuilder
    var label: some View {
        switch self {
        case .home:
            Label("\(self)", systemImage: "plus")
        case .discover(let deepLink):
            Label("\(self)", systemImage: "plus")
        case .store:
            Label("\(self)", systemImage: "plus")
        case .profile:
            Label("\(self)", systemImage: "plus")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .home:
            HomeNavigationStack()
        case .discover(let deeplink):
            DiscoverNavigationStack()
        case .store:
            StoreNavigationStack()
        case .profile:
            MeNavigationStack()
        }
    }
    
}

@MainActor final class TabCoordinator: ObservableObject { // todo make generic
    @Published var tabItems: [Tab] = []
    @Published var selectedTab: Tab = .home
    
    init(deeplink: DeepLink) {
        if deeplink == .ca {
            tabItems = [.home, .discover(.ca), .store, .profile]
            selectedTab = .discover(.ca)
        } else {
            tabItems = [.home, .discover(.none), .store, .profile]
        }
    }
    
    func selectTab(tab: Tab) {
        selectedTab = tab
    }
}

@MainActor final class HomeCoordinator: ObservableObject {
    @Published var homePath = NavigationPath()
    
    func push(next: HomeRoute) {
        homePath.append(next)
    }
    
    func pop() {
        homePath.removeLast()
    }
}

@MainActor final class MeCoordinator: ObservableObject {
    @Published var mePath = NavigationPath()
    
    func push(next: MeRoute) {
        mePath.append(next)
    }
    
    func pop() {
        mePath.removeLast()
    }
}

@MainActor final class StoreCoordinator: ObservableObject {
    @Published var storePath = NavigationPath()
    
    func push(next: StoreRoute) {
        storePath.append(next)
    }
    
    func pop() {
        storePath.removeLast()
    }
}

@MainActor final class DiscoverCoordinator: ObservableObject {
    @Published var discoverPath = NavigationPath()
    
    func push(next: DiscoverRoute) {
        discoverPath.append(next)
    }
    
    func pop() {
        discoverPath.removeLast()
    }
    
    func navigateTo(next: DiscoverRoute) {
        
    }
}
