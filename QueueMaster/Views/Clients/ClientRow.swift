//
//  ClientRow.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 27/03/2023.
//

import SwiftUI

struct ClientRow: View {
    
    let name: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(name)
            
            Spacer()
        }
        .font(.subheadline)
    }
}

struct ClientRow_Previews: PreviewProvider {
    static var previews: some View {
        ClientRow(name: "Adi Amoyal")
    }
}
