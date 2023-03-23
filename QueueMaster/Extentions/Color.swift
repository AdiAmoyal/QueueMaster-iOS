//
//  Color.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/03/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let blue = Color("BlueColor")
    let secondaryText = Color("SecondaryTextColor")
}
