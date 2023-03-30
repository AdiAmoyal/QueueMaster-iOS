//
//  QueueMasterApp.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/03/2023.
//

import SwiftUI

@main
struct QueueMasterApp: App {
    
    @StateObject var coreDataVM = CoreDataViewModel()
    
    var body: some Scene {
        WindowGroup {
//            NavigationView {
//                Login()
            Home()
                .environmentObject(coreDataVM)
//            }
//            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
