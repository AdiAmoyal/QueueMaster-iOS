//
//  LoginBtn.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/03/2023.
//

import SwiftUI

struct LoginBtn: View {
    
    var text: String
    
    var body: some View {
        Button(action: {  }) {
            HStack(spacing: 15) {
                Text(text)
                    .fontWeight(.semibold)
                
                Image(systemName: "line.diagonal.arrow")
                    .rotationEffect(.init(degrees: 45))
            }
            .font(.title3)
            .foregroundColor(Color.theme.secondaryText)
            .padding(.all, 12)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.theme.green)
            }
        }
        .padding()
    }
}

//struct LoginBtn_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginBtn()
//    }
//}
