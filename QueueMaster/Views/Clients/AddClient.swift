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
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                titleSection
                VStack {
                    CustomTextField(title: "Full name", text: $fullName)
                    CustomTextField(title: "Phone numbe", text: $phoneNumber)
                }
                Spacer()
                saveButton
            }
            .padding()
        }
    }
}

extension AddClient {
    
    private var titleSection: some View {
        Text("Add Client")
            .font(.largeTitle)
            .fontWeight(.thin)
            .foregroundColor(Color.theme.green)
    }
    
    private var saveButton: some View {
        Button(action: {
            // MARK: - Add validation test
            print("Add Client --> Name: \(fullName) ; Phone: \(phoneNumber)")
            coreDataVM.addClient(name: fullName, phone: phoneNumber)
            fullName = ""
            phoneNumber = ""
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack(spacing: 10) {
                Text("Save".uppercased())
                Image(systemName: "tray.and.arrow.down")
            }
            .foregroundColor(Color.theme.secondaryText)
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.horizontal)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.theme.green)
                    .shadow(color: Color.theme.accent.opacity(0.8), radius: 4, x: 0, y: 3)
            )
            
        }
        .padding(.bottom, 20)
    }
    
    // MARK: Add Close Btn
    
}

struct AddClient_Previews: PreviewProvider {
    static var previews: some View {
        AddClient()
            .environmentObject(CoreDataViewModel())
    }
}
