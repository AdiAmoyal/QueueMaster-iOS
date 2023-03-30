//
//  Calendar.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 27/03/2023.
//

import SwiftUI

struct Calendar: View {
    
    @EnvironmentObject var coreDataVM: CoreDataViewModel
    
    var body: some View {
        VStack {
            Button(action: coreDataVM.addQueue) {
                Text("Add Queue")
            }
        }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}
