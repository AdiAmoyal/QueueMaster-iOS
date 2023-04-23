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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.green)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.green)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Home()
                    .environmentObject(coreDataVM)
            }
//            NavigationView {
//                Login()
            
//            }
//            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
