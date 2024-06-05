//
//  NewPageModule.swift
//  Ujitsu
//
//  Created by Виталий Вишняков on 14.05.2024.
//

import SwiftUI

@MainActor final class NewPageViewModel: ObservableObject {
    @Published var count = 1
    private var homeCoordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        homeCoordinator = coordinator
    }
    
    func add() {
        count += 1
    }
    
    func closeAfter() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.homeCoordinator.pop()
        }
    }
}

struct NewPageView: View {
    @StateObject var viewModel: NewPageViewModel
    @State var isPresent = false
    
    var body: some View {
        Text("newScreen   \(viewModel.count)")
        Button("Close after") {
            viewModel.closeAfter()
        }
        
        Button("Close show popup") {
            isPresent.toggle()
        }
        .popover(isPresented: $isPresent, content: {
            Text("Popuver")
        })
    }
}
