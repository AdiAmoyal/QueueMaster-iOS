//
//  Home.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/03/2023.
//

import SwiftUI

struct Home: View {

    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Calendar()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
                .tag(0)
            
            Clients()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Clients")
                }
                .tag(1)
        }
        .accentColor(Color.theme.green)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
