//
//  ClientsList.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/04/2023.
//

import SwiftUI

struct ClientsList: View {
    
    @EnvironmentObject var coreDataVM: CoreDataViewModel
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
            clientsList
        }
    }
    
    private var clientsList: some View {
        List {
            ForEach(coreDataVM.clients) { client in
                ClientRow(name: client.name ?? "No Name")
            }
            .onDelete(perform: coreDataVM.deleteClient)
        }
        .listStyle(PlainListStyle())
    }
}

struct ClientsList_Previews: PreviewProvider {
    static var previews: some View {
        ClientsList()
    }
}
