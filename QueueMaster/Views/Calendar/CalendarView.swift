//
//  Calendar.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 27/03/2023.
//

import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var coreDataVM: CoreDataViewModel
    
    @State private var currentDay: Date = .init()
    
    @State private var queues: [QueueModel] = sampleQueue
    
    @State private var addNewQueue: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            timelineView
                .padding(15)
        }
        .safeAreaInset(edge: .top) {
            Header(currentDay: $currentDay, addNewQueue: $addNewQueue)
        }
        .fullScreenCover(isPresented: $addNewQueue) {
            AddQueue()
        }
    }
}

extension CalendarView {
    
    private var timelineView: some View {
        ScrollViewReader { proxy in
            let hours = Calendar.current.hours
            let midHour = hours[hours.count / 2]
            
            VStack {
                ForEach(hours, id: \.self) { hour in
                    TimelineViewRow(date: hour, queues: $queues, currentDay: $currentDay)
                        .id(hour)
                }
            }
            .onAppear {
                proxy.scrollTo(midHour)
            }
        }
    }
}



struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
