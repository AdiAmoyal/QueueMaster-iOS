//
//  AddClient.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 27/03/2023.
//

import SwiftUI

struct AddClient: View {
    
    @EnvironmentObject var coreDataVM: CoreDataViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var fullName: String = ""
    @State var phoneNumber: String = ""
    @State var notes: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        CustomTextField(title: "Full name", text: $fullName)
                        CustomTextField(title: "Phone numbe", text: $phoneNumber)
                        CustomTextField(title: "Notes", text: $notes)
                    }
                    .padding(.top, 30)
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("New Client")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    cancelButton
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    saveButton
                }
            }
        }
        
    }
}

extension AddClient {
    private var saveButton: some View {
        Button(action: {
            // MARK: - Add validation test
            coreDataVM.addClient(name: fullName, phone: phoneNumber, notes: notes)
            fullName = ""
            phoneNumber = ""
            notes = ""
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "tray.and.arrow.down")
                .foregroundColor(Color.theme.green)
        }
    }
    
    private var cancelButton: some View {
        Button(action: { presentationMode.wrappedValue.dismiss() }) {
            Image(systemName: "xmark")
                .foregroundColor(Color.theme.green)
        }
    }
}

struct AddClient_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddClient()
                .environmentObject(CoreDataViewModel())
        }
    }
}
