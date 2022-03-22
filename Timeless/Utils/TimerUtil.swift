//
//  TimerUtil.swift
//  Timeless
//
//  Created by Joe Speakman on 3/18/22.
//

import Foundation

//class TimerUtil {
//    
//    let competitionDate = NSDateComponents()
//    let date = NSDate()
//    let calendar = Calendar.current
//    let userCalendar = Calendar.current
//    
//    @objc func updateSecondTimer(date: Date) {
//        let components = calendar.dateComponents([.hour, .minute, .month, .year, .day], from: date as Date)
//        let currentDate = calendar.date(from: components)
//        let yearint = Int(date.year)
//        let monthint = Int(month!)
//        let dayint = Int(day!)
//        let hourInt = Int(hour!)
//        let minuteInt = Int(minute!)
//        
//        // Date of event
//        competitionDate.year = yearint!
//        competitionDate.month = monthint!
//        competitionDate.day = dayint!
//        competitionDate.hour = hourInt!
//        competitionDate.minute = minuteInt!
//        let competitionDay = userCalendar.date(from: competitionDate as DateComponents)!
//        let CompetitionDayDifference = calendar.dateComponents([.day, .hour, .minute], from: currentDate!, to: competitionDay)
//        let daysLeft = CompetitionDayDifference.day
//        let hoursLeft = CompetitionDayDifference.hour
//        let minutesLeft = CompetitionDayDifference.minute
//        
//        }
//}
