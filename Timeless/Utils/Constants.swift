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
        static var appName = "TimeBoard"
        
    }
    
    struct TimeBoard {
        static var padding = 10.0
        static var shareLabel = "Share"
        static var editLabel = "Edit Countdown"
        static var timeLeft = "Time Left"
    }
    struct ModifyTimer {
        static var createTimer = "Create Timer"
        static var editTimer = "Edit Timer"
        static var firstSectionHeader = "Set Details"
        static var coutndownTextFeild = "Vacation!"
        static var emojiTextFeild = "Type an emoji"
        static var emojiErrorTitle = "Error"
        static var emojiErrorMessage = "Please Check to make sure that only one emoji was entered."
        static var emojiErrorButton = "Try Again"
        static var colorLabel = "Set Timer border color"
        static var countdownLabel = "Countdown to:"
        static var dateTimeLabel = "Date & Time"
        static var saveButton = "Save"
        static var navTitle = "Configure Countdown"
        
    }
    struct AddTimer {
        static var startText = "Get Started"
        static var createText = "Create First timer"

    }
    struct AddText {
        static var startText = "Share the countdown with style."
        static var createText = "Add custom share messages"
        
    }
    struct Settings {
        static var navTitle = "Settings"
        static var editLabel = "Edit Share Text"
        static var createLabel = "Create Countdown"
        static var aboutLabel = "About"
    }
    
    struct Gradients {
        static var gradient: LinearGradient {
            LinearGradient(colors: [.red, .purple, .blue], startPoint: .leading, endPoint: .trailing)
        }
        static var seccondGradient: LinearGradient {
            LinearGradient(colors: [.mint, .cyan, .blue], startPoint: .leading, endPoint: .trailing)
        }
    }
}
