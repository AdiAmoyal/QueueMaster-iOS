//
//  ClientDetails.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 20/04/2023.
//

import SwiftUI

struct ClientDetails: View {
    
    @Binding var client: Client?
    
    var body: some View {
        ZStack {
            if let client = client {
                DetailView(client: client)
            }
        }
    }
}

struct DetailView: View {
    
    var client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    var body: some View {
        VStack(spacing: 10) {
            nameTitle
            phoneSection
            notesSection
            queuesSection

            Spacer()
        }
        .padding(.horizontal, 8)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }
}

extension DetailView {
    
    private var nameTitle: some View {
        Text(client.name ?? "")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.theme.green)
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var phoneSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Mobile")
                .font(.title2)
                .fontWeight(.light)
                .foregroundColor(Color.theme.green)
            
            Text(client.phone ?? "")
                .fontWeight(.medium)
                .foregroundColor(Color.theme.accent)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.theme.blue ,lineWidth: 1)
                .padding(6)
        )
    }
    
    private var notesSection: some View {
        VStack(alignment: .leading) {
            Text("Notes")
                .font(.title2)
                .fontWeight(.light)
                .foregroundColor(Color.theme.green)
                .padding(.bottom, 3)
            
            ScrollView {
                Text(client.notes ?? "")
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 170, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.theme.blue ,lineWidth: 1)
                .padding(6)
        )
    }
    
    private var queuesSection: some View {
        VStack(alignment: .leading) {
            Text("Queues")
                .font(.title2)
                .fontWeight(.light)
                .foregroundColor(Color.theme.green)
                .padding(.bottom, 3)
            
            List {
                
            }
        }
        .padding()
//        .frame(maxWidth: .infinity, maxHeight: 170, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.theme.blue ,lineWidth: 1)
                .padding(6)
        )
    }
}

struct ClientDetails_Previews: PreviewProvider {
    static var previews: some View {
        Clients()
            .environmentObject(CoreDataViewModel())
    }
}
