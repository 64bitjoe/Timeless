//
//  TimerUtil.swift
//  Timeless
//
//  Created by Joe Speakman on 3/18/22.
//

import Foundation

class TimerUtil {
    
    let competitionDate = NSDateComponents()
    let date = NSDate()
    let calendar = Calendar.current
    let userCalendar = Calendar.current

    
    @objc func calculate(date: Date) -> String {
        let components = calendar.dateComponents([.hour, .minute, .month, .year, .day], from: date as Date)
        let currentDate = calendar.date(from: components)
        let yearint = components.year as Int?
        let monthint = components.month as Int?
        let dayint = components.day as Int?
        
        competitionDate.year = yearint!
        competitionDate.month = monthint!
        competitionDate.day = dayint!
        let competitionDay = userCalendar.date(from: competitionDate as DateComponents)!
        let CompetitionDayDifference = calendar.dateComponents([.day], from: currentDate!, to: competitionDay)
        let daysLeft = CompetitionDayDifference.day
//        let hoursLeft = CompetitionDayDifference.hour
//        let minutesLeft = CompetitionDayDifference.minute
        
        return daysLeft?.description ?? "ERROR"
        
    }
}
