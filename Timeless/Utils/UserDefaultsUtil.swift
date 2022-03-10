//
//  UserDefaultsUtil.swift
//  Timeless
//
//  Created by Joe Speakman on 3/3/22.
//

import Foundation
import SwiftUI


class UserDefaultsUtil {
    
    let userDefaults = UserDefaults.standard
    
    private var data: [Any] = []
    
    // Read data function
    func readData(idenifier: String) -> [Any] {
        
        data = userDefaults.object(forKey: idenifier) as? [Any] ?? []
        
        return data
    }
    
    // Update data function
    func updateData(idenifier: String, data: [Any]) {
        
        userDefaults.set(data, forKey: idenifier)
        
    }
    
}

struct ShareTextObject: Identifiable, Codable {
    var id = UUID()
    let message: String
    
}

class SharedText: ObservableObject {
    @Published var items = [ShareTextObject]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try?
                encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey:"ShareText")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "ShareText"){
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([ShareTextObject].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
   
}

func randomShare () -> ShareTextObject {
    return SharedText.init().items.randomElement()!
}

class LaunchUtil {
    
    static func firstLaunch() -> Bool {
        let launchedBefore = UserDefaults.standard.bool(forKey: Constants.LaunchUtil.EditScreen)
        if launchedBefore {
            return false
        } else {
            let item = ShareTextObject(message: "Look at this!")
            SharedText().items.append(item)
            firstLaunchComplete()
            return true
        }
    }
    
    static func firstLaunchComplete() {
        UserDefaults.standard.set(true, forKey: Constants.LaunchUtil.EditScreen)
    }
    
    static func checkLaunch() -> Bool{
        if UserDefaults.standard.bool(forKey: Constants.LaunchUtil.EditScreen) {
            return true
        } else {
            return false
        }
    }
}

