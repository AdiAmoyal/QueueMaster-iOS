//
//  AddQueue.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/04/2023.
//

import SwiftUI

struct AddQueue: View {
        
    @EnvironmentObject var coreDataVM: CoreDataViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var client: Client? = nil
    @State private var description: String = ""
    @State private var date: Date = .init()
    @State private var selectedCategory: Category = .general
    @State private var showClientsList: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Button(action: { presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .contentShape(Rectangle())
                    }
                    
                    Spacer()
                    
                    saveButton
                }
                
                Text("Create New Queue")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
            .background {
                selectedCategory.color
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                
                clientSection
                
                Rectangle()
                    .fill(Color.theme.accent.opacity(0.5))
                    .frame(height: 1)
                
                dateSection
                
                Rectangle()
                    .fill(Color.theme.accent.opacity(0.5))
                    .frame(height: 1)
                
                descriptionSection
                
                Rectangle()
                    .fill(Color.theme.accent.opacity(0.5))
                    .frame(height: 1)
                
                categorySection
                
            }
            .padding(15)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

extension AddQueue {
    
    private var backButton: some View {
        Button(action: { presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
                .contentShape(Rectangle())
        }
    }
    private var saveButton: some View {
        Button(action: {
            // MARK: - Add validation
            if let client = client {
                coreDataVM.addQueue(client: client, date: date, description: description, category: selectedCategory)
                self.client = nil
                description = ""
                date = .init()
                selectedCategory = .general
                presentationMode.wrappedValue.dismiss()
            }
        }) {
            Image(systemName: "tray.and.arrow.down")
                .foregroundColor(.white)
                .contentShape(Rectangle())
        }
    }
    
    private var clientSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Client")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(Color.theme.green)
            
            HStack {
                Text(client != nil ? (client?.name ?? "") : "Choose Client")
                Image(systemName: "chevron.right")
            }
            .onTapGesture {
                showClientsList.toggle()
            }
            .sheet(isPresented: $showClientsList) {
                ClientsList()
            }
        }
    }
    
    private var dateSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Date")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(Color.theme.green)
            
            HStack(alignment: .bottom, spacing: 12) {
                HStack(spacing: 12){
                    Text(date.toString("EEEE dd, MMMM"))
                    
                    Image(systemName: "calendar")
                        .font(.title3)
                        .overlay {
                            DatePicker("", selection: $date,displayedComponents: [.date])
                                .blendMode(.destinationOver)
                        }
                }
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.theme.accent.opacity(0.8))
                        .frame(height: 0.5)
                        .offset(y: 2)
                }
                
                HStack(spacing: 12){
                    Text(date.toString("hh:mm a"))

                    Image(systemName: "clock")
                        .font(.title3)
                        .overlay {
                            DatePicker("", selection: $date,displayedComponents: [.hourAndMinute])
                                .blendMode(.destinationOver)
                        }
                }
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.theme.accent.opacity(0.8))
                        .frame(height: 0.5)
                        .offset(y: 2)
                }
            }
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(Color.theme.green)
            
            TextField("About Your Queue", text: $description)
        }
    }

    private var categorySection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Category")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(Color.theme.green)
            
            LazyVGrid(columns: Array(repeating: .init(.flexible(),spacing: 20), count: 3),spacing: 15) {
                ForEach(Category.allCases,id: \.rawValue){ category in
                    Text(category.rawValue.uppercased())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 5)
                        .background {
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(category.color.opacity(0.25))

                            if selectedCategory == category {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .stroke(category.color, lineWidth: 2)
                            }
                        }
                        .foregroundColor(category.color)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                selectedCategory = category
                            }
                        }
                }
            }
        }
    }
}

struct AddQueue_Previews: PreviewProvider {
    static var previews: some View {
        AddQueue()
    }
}
