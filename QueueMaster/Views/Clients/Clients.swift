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
    @State var showDetailView: Bool = false
    @State var selectedClient: Client? = nil
    
    var body: some View {
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
            .background(
                NavigationLink(
                    destination: ClientDetails(client: $selectedClient),
                    isActive: $showDetailView,
                    label: { EmptyView() }
                )
            )
        }
    }
    
    private var clientsList: some View {
        List {
            ForEach(coreDataVM.clients) { client in
                ClientRow(name: client.name ?? "No Name")
                    .onTapGesture {
                        segue(client: client)
                    }
            }
            .onDelete(perform: coreDataVM.deleteClient)
        }
        .listStyle(PlainListStyle())
    }
    
    private func segue(client: Client) {
        showDetailView = true
        selectedClient = client
    }
}

struct Clients_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Clients()
                .environmentObject(CoreDataViewModel())
        }
        
    }
}
