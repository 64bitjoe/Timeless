//
//  Timer.swift
//  Timeless
//
//  Created by Joe Speakman on 5/10/21.
//

import Foundation
import SwiftUI

class FirstTimer: ObservableObject {
    @Published var name = "Vacation!"
    @Published var emoji = "🏝"
    @Published var endDate = "Aug 10th 2022"
    @Published var color = Color.red
    @Published var gradientColors = [Color.red, Color.purple, Color.blue]
}
