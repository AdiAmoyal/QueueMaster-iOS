//
//  QueueMasterApp.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/03/2023.
//

import SwiftUI

@main
struct QueueMasterApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Login()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
