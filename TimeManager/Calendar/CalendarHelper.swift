//
//  CalendarHelper.swift
//  TimeManager
//
//  Created by Amardeep on 22/02/22.
//  Copyright © 2022 Amardeep. All rights reserved.
//

import Foundation

class CalendarHelper: NSObject {
    /**
    Sets time in Date() to end of date  for hr, min, sec
     - Parameter date1: First date to compare
     - Parameter date2: Date to compare with date1
    - Returns:- Int: value representing difference in minutes
    */
   class func timeDifferenceInMinute(date1: Date, date2: Date) -> Int {
        let calendar = Calendar.current
        let component1 = calendar.dateComponents(in: TimeZone.current, from: date1)
        let Component2 = calendar.dateComponents(in: TimeZone.current, from: date2)
         var difference = 0
        if let date1 = calendar.date(from: component1), let date2 = calendar.date(from: Component2) {
            difference = Int(date1.timeIntervalSince(date2) / 60)
        }
        return Int(abs(difference))
    }

    /**
    Finds number of months between two given dates
     - Parameter fromDate: date1 which will be begining date
     - Parameter toDate: date1 which will be begining date
    - Returns: - Int: number of months in given two dates
    */
    class func findMonthDifference(fromDate: Date,toDate: Date) -> Int {
            let fromDt = fromDate.getStartOfMonth()
            let toDt = toDate.getStartOfMonth()
            return Calendar.current.dateComponents([.month], from: fromDt, to: toDt).month!
    }

    /**
    Finds number of Weeks between two given dates
     - Parameter fromDate: date1 which will be begining date
     - Parameter toDate: date1 which will be begining date
    - Returns: - Int: number of weeks in given two dates
    */
    class func findWeekDifference(fromDate: Date, toDate: Date) -> Int {
        let fromDt = fromDate.getStartOfWeek()
        let toDt = toDate.getStartOfWeek()
        let val = Calendar.current.dateComponents([.weekOfYear], from: fromDt, to: toDt).weekOfYear!
        return val
    }
}
