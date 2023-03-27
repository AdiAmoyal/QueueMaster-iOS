//
//  Client.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 27/03/2023.
//

import Foundation

struct Client: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let phone: String
//    let queues: [Queue]
}
