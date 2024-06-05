//
//  UjitsuApp.swift
//  Ujitsu
//
//  Created by Виталий Вишняков on 14.05.2024.
//

import SwiftUI

@main
struct UjitsuApp: App {
    @State var openFromUrl: DeepLink = .ca
    var body: some Scene {
        WindowGroup {
            ContentView(tabCoordinator: TabCoordinator(deeplink: openFromUrl))
        }
    }
}
