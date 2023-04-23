//
//  QueueCategory.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/04/2023.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable {
    case general = "General"
    case manHaircut = "Man Haircut"
    
    var color: Color {
        switch self {
        case .general:
            return Color.gray
        case .manHaircut:
            return Color.theme.blue
        }
    }
}
