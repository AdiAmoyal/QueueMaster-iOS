//
//  Customers.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/03/2023.
//

import SwiftUI

struct Clients: View {
    
    var clients: [Client] = [
        Client(name: "Adi Amoyal", phone: "0508766667"),
        Client(name: "Noam Amoyal", phone: "0501234567"),
        Client(name: "Yuval Mirski", phone: "0506543217"),
        Client(name: "Maya Kagan", phone: "0541254367")
    ]
    
    @State var searchText: String = ""
    @State var showAddClient: Bool = false
    
    
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
        }
    }
    
    private var clientsList: some View {
        List {
            ForEach(clients) { client in
                ClientRow(name: client.name)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct Clients_Previews: PreviewProvider {
    static var previews: some View {
        Clients()
    }
}
