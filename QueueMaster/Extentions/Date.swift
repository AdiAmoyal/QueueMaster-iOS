//
//  Date.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/04/2023.
//

import Foundation

extension Date {
    func toString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
