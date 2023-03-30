//
//  Customers.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/03/2023.
//

import SwiftUI

struct Clients: View {
    
    @EnvironmentObject var coreDataVM: CoreDataViewModel
    
    @State var searchText: String = ""
    @State var showAddClient: Bool = false
    
    var body: some View {
        // Change the Navigation View to Costume Header
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    SearchBar(searchText: $searchText)
                    clientsList
                }
            }
            .navigationTitle("Clients")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button(action: { showAddClient.toggle() }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showAddClient, content: { AddClient() })
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

struct Clients_Previews: PreviewProvider {
    static var previews: some View {
        Clients()
            .environmentObject(CoreDataViewModel())
    }
}
