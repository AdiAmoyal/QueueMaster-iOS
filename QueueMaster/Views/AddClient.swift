//
//  AddClient.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 27/03/2023.
//

import SwiftUI

struct AddClient: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var fullName: String = ""
    @State var phoneNumber: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                Text("Add Client")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .foregroundColor(Color.theme.green)
                
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
    
    private var saveButton: some View {
        Button(action: {
            print("Add Client --> Name: \(fullName) ; Phone: \(phoneNumber)")
            
            fullName = ""
            phoneNumber = ""
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
}

struct AddClient_Previews: PreviewProvider {
    static var previews: some View {
        AddClient()
    }
}
