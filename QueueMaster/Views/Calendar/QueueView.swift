//
//  QueueView.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/04/2023.
//

import SwiftUI

struct QueueView: View {
    
    var queue: QueueModel
    
    var body: some View {
        VStack(alignment: .leading ,spacing: 5) {
            Text(queue.client.uppercased())
                .foregroundColor(queue.queueCategory.color)
            
            if queue.queueDescription != "" {
                Text(queue.queueDescription)
                    .fontWeight(.light)
                    .foregroundColor(queue.queueCategory.color.opacity(0.8))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(queue.queueCategory.color)
                    .frame(width: 4)
                
                Rectangle()
                    .fill(queue.queueCategory.color.opacity(0.25))
            }
        }
    }
}

struct QueueView_Previews: PreviewProvider {
    static var previews: some View {
        QueueView(queue: sampleQueue[0])
    }
}
