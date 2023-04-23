//
//  Header.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/04/2023.
//

import SwiftUI

struct Header: View {
    
    @Binding var currentDay: Date
    @Binding var addNewQueue: Bool
    
    var body: some View {
        VStack {
            HStack {
                welcomeSection
                addQueueBtn
            }
            
            todayDate
            weekRow
        }
        .padding(15)
        .background {
            VStack(spacing: 0) {
                Color.theme.background
                
                Rectangle()
                    .fill(
                        .linearGradient(
                            colors: [.white, .clear],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .frame(height: 20)
            }
            .ignoresSafeArea()
        }
    }
}

extension Header {
    private var welcomeSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Today")
                .font(.title2)
                .fontWeight(.light)
            
            Text("Welcome, Adi.")
                .font(.callout)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var addQueueBtn: some View {
        Button(action: { addNewQueue.toggle() }) {
            HStack {
                Image(systemName: "plus")
                Text("Add Queue")
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .background(
                Capsule()
                    .fill(Color.theme.blue.gradient)
            )
            .foregroundColor(.white)
        }
    }
    
    private var todayDate: some View {
        Text(Date().toString("MMM YYYY"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.headline)
            .padding(.top, 10)
    }
    
    private var weekRow: some View {
        HStack(spacing: 0) {
            ForEach(Calendar.current.currentWeek) { weekDay in
                let status = Calendar.current.isDate(weekDay.date, inSameDayAs: currentDay)
                VStack(spacing: 6) {
                    Text(weekDay.string.prefix(3))
                        .font(.callout)
                    Text(weekDay.date.toString("dd"))
                        .fontWeight(status ? .medium : .regular)
                }
                .foregroundColor(status ? Color.theme.green : Color.theme.secondaryText)
                .frame(maxWidth: .infinity, alignment: .center)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentDay = weekDay.date
                    }
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, -15)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(currentDay: .constant(.init()), addNewQueue: .constant(false))
    }
}
