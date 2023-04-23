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
    
    @State private var client: String = ""
    @State private var description: String = ""
    @State private var date: Date = .init()
    @State private var category: Category = .general
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                Button(action: { presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.theme.secondaryText)
                        .contentShape(Rectangle())
                }
                
                Text("Create New Queue")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(Color.theme.secondaryText)
                    .padding(.vertical, 5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
            .background {
                category.color
                    .ignoresSafeArea()
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

extension AddQueue {
    
    private var customSection: some View {
        VStack {
            Text("NAME")
            
            
        }
    }
}

struct AddQueue_Previews: PreviewProvider {
    static var previews: some View {
        AddQueue()
    }
}
