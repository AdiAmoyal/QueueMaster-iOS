//
//  TimelineViewRow.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/04/2023.
//

import SwiftUI

struct TimelineViewRow: View {
    
    var date: Date
    @Binding var queues: [QueueModel]
    @Binding var currentDay: Date
    
    var body: some View {
        HStack(alignment: .top) {
            Text(date.toString("h a"))
                .font(.footnote)
                .frame(width: 45, alignment: .leading)
            
            let calendar = Calendar.current
            let filteredQueue = queues.filter {
                if let hour = calendar.dateComponents([.hour], from: date).hour,
                   let queueHour = calendar.dateComponents([.hour], from: $0.dateAdded).hour,
                   hour == queueHour && calendar.isDate($0.dateAdded, inSameDayAs: currentDay){
                    return true
                }
                return false
            }
            
            if filteredQueue.isEmpty {
                Rectangle()
                    .stroke(
                        Color.theme.secondaryText,
                        style: StrokeStyle(
                            lineWidth: 0.5,
                            lineCap: .butt,
                            lineJoin: .bevel,
                            dash: [5],
                            dashPhase: 5
                        )
                    )
                    .frame(height: 0.5)
                    .offset(y: 10)
            } else {
                VStack(spacing: 0) {
                    ForEach(filteredQueue) { queue in
                        QueueView(queue: queue)
                    }
                }
            }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 15)
    }
}

struct TimelineViewRow_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
