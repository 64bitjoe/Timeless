//
//  Constants.swift
//  Timeless
//
//  Created by Joe Speakman on 1/16/22.
//

import Foundation
import SwiftUI

struct Constants {
    
    static var emptyString = ""
    static var appColor = Color.indigo
    
    struct Images {
        static var plus = Image(systemName: "plus")
        static var share = Image(systemName: "square.and.arrow.up")
        static var edit = Image(systemName: "pencil")
        static var trash = Image(systemName: "trash")
    }
    struct Labels {
        static var appName = "TimeBoard"
        
    }
    struct Defaults {
        static var initalShareText = "Look at this!"
    }
    
    struct TimeBoard {
        static var padding = 10.0
        static var shareLabel = "Share"
        static var editLabel = "Edit Countdown"
        static var inLabel = "in"
        static var timeLeft = "Days"
        
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
        static var missingValueMessage = "One or more fields are missing entries."
        static var colorLabel = "Set Timer border color"
        static var gradentColor0 = "Start Color"
        static var gradentColor1 = "Middle Color"
        static var gradentColor2 = "End Color"
        static var countdownLabel = "Countdown to:"
        static var dateTimeLabel = "Date & Time"
        static var saveButton = "Save"
        static var navTitle = "Configure Countdown"
        static var gradientLabel = "Gradient"
        
    }
    struct AddTimer {
        static var startText = "Get Started"
        static var createText = "Create First timer"
        
    }
    struct AddText {
        static var startText = "Share the countdown with style."
        static var createText = "Add custom share messages"
        static var navTitle = "Customize Share Text"
        static var textFieldPlaceholder = "Share Message"
    }
    struct Settings {
        static var navTitle = "Settings"
        static var editLabel = "Edit Share Text"
        static var createLabel = "Create Countdown"
        static var aboutLabel = "About"
    }
    struct About {
        static var navTitle = "About Timeless"
    }
    struct Gradients {
        static var gradient: LinearGradient {
            LinearGradient(colors: [.red, .purple, .blue], startPoint: .leading, endPoint: .trailing)
        }
        static var seccondGradient: LinearGradient {
            LinearGradient(colors: [.mint, .cyan, .blue], startPoint: .leading, endPoint: .trailing)
        }
        
    }
    struct LaunchUtil {
        static let EditScreen = "EditHintSeen"
    }
}
