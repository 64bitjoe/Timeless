//
//  Constants.swift
//  Timeless
//
//  Created by Joe Speakman on 1/16/22.
//

import Foundation
import SwiftUI

struct Constants {
    
    struct Images {
        static var plus = Image(systemName: "plus")
        static var share = Image(systemName: "square.and.arrow.up")
        static var edit = Image(systemName: "pencil")
    }
    struct Labels {
        static var appName = "Cats Does Countdown"
        
    }
    
    struct TimeBoard {
        static var padding = 10.0
        static var shareLabel = "Share"
        static var editLabel = "Edit Countdown"
        static var timeLeft = "Time Left"
    }
    struct ModifyTimer {
        
        static var emojiErrorTitle = "Error"
        static var emojiErrorMessage = "Please Check to make sure that only one emoji was entered."
        static var emojiErrorButton = "Try Again"
    }
    struct AddTimer {
        static var startText = "Get Started"
        static var createText = "Create First timer"

    }
    
    struct Gradient {
        static var gradient: LinearGradient {
            LinearGradient(colors: [.red, .purple, .blue], startPoint: .leading, endPoint: .trailing)
        }
    }
}
