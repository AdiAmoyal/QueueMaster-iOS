//
//  CustomTextField.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/03/2023.
//

import SwiftUI

struct CustomTextField: View {
    
    var title: String
    @Binding var text: String
    @FocusState var isEnabled: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            TextField(title, text: $text)
                .foregroundColor(Color.theme.secondaryText)
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
                .cornerRadius(10)
                .focused($isEnabled)
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.theme.accent)
                
                Rectangle()
                    .fill(Color.theme.green)
                    .frame(width: isEnabled ? nil : 0, alignment: .leading)
                    .animation(.easeInOut(duration: 0.6), value: isEnabled)
            }
            .frame(height: 2)
        }
    }
}

//struct CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField()
//    }
//}
