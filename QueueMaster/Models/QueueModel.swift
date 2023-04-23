//
//  QueueModel.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/04/2023.
//

import Foundation
import SwiftUI

struct QueueModel: Identifiable {
    var id: UUID = .init()
    var dateAdded: Date
    var client: String
    var queueDescription: String
    var queueCategory: Category
}

var sampleQueue: [QueueModel] = [
    .init(dateAdded: Date(), client: "Adi Amoyal", queueDescription: "Blonde color", queueCategory: .manHaircut)
]
