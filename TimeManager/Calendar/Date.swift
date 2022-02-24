//
//  Calendar.swift
//  TimeManager
//
//  Created by Amardeep on 22/02/22.
//  Copyright © 2022 Amardeep. All rights reserved.
//

import Foundation
import UIKit

public extension Date {
    /**
     Adds given minutes to 'specified date
     - Parameter  minutes: Minutes to be added
     - Returns: - Date: Date object after adding the specific minutes
     */
    func addMinutes(minutes: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(minutes * 60))
    }
    
    /// This method calcuates difference in Minutes comaparint to given date
    /// - Parameter toDate: date to compare with
    /// - Returns: Difference in minutes
    func minuteDifference(toDate: Date) -> Int {
        let fromDt = self
        let toDt = toDate
        return Calendar.current.dateComponents([.minute], from: fromDt, to: toDt).minute!
    }
    
    func checkWhetherSameDay(withDate: Date) -> Bool {
        let calendar = Calendar.current
        let date1 = calendar.dateComponents(in: TimeZone.current, from: self)
        let date2 = calendar.dateComponents(in: TimeZone.current, from: withDate)
        
        return (date1.day == date2.day) && (date1.month == date2.month) && (date1.year == date2.year)
    }
    
    func round15Minute() -> Date {
        let calendar1  = Calendar.current
        var component = calendar1.dateComponents([.day,.month, .year,.hour, .minute, .second, .nanosecond], from: self)
        component.second = 0
        component.nanosecond = 0
        let newValue = round(Double(component.minute!) / 15) * 15
        if newValue == 60 {
            component.hour! += 1
            component.minute = 00
            return Calendar.current.date(from: component)!
        }
        else {
            component.minute = Int(newValue)
            return Calendar.current.date(from: component)!
        }
    }
    
    func nameOfDayFromDate() -> String {
        let calendar = Calendar.current
        // var today = calendar.startOfDay(for: Date())
        let dayOfWeek = calendar.component(.day, from: self)
        
        switch dayOfWeek {
            case 1:
                return "Sunday"
            case 2:
                return "Monday"
            case 3:
                return "Tuesday"
            case 4:
                return "Wednesday"
            case 5:
                return "Thursday"
            case 6:
                return "Friday"
            case 7:
                return "Saturday"
            default:
                return ""
        }
    }
    
    func shortNameOfDayFromDate() -> String {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        //   NSTimeZone.default = TimeZone(abbreviation: Util.getSystemTimeZone())!
        
        let myCalendar = Calendar(identifier: .gregorian)
        let dayOfWeek = myCalendar.component(.weekday, from: self)
        switch dayOfWeek {
            case 1:
                return "Sun"
            case 2:
                return "Mon"
            case 3:
                return "Tue"
            case 4:
                return "Wed"
            case 5:
                return "Thur"
            case 6:
                return "Fri"
            case 7:
                return "Sat"
            default:
                return "Sun"
        }
    }
    
    // Function will reutrn the current month Number
    func  get_Month() -> String {
        let calendar: NSCalendar = Calendar.current as NSCalendar
        let component: NSDateComponents = calendar.components(NSCalendar.Unit.month, from: self) as NSDateComponents
        switch component.month {
            case 1:
                return "January"
            case 2:
                return "February"
                
            case 3:
                return "March"
                
            case 4:
                return "April"
            case 5:
                return "May"
                
            case 6:
                return "June"
                
            case 7:
                return "July"
                
            case 8:
                return "August"
                
            case 9:
                return "September"
                
            case 10:
                return "October"
                
            case 11:
                return "November"
                
            case 12:
                return "December"
                
            default:
                return ""
        }
        
    }
    
    // Function Will return the number of day of the month.
    func  get_Day() -> String {
        //        let calendar: NSCalendar = Calendar.current as NSCalendar
        //        let component: NSDateComponents = calendar.components(NSCalendar.Unit.day, from: self) as NSDateComponents
        //        return component.day;
        let dateFormatter = DateFormatter()
        
        //    NSTimeZone.default = TimeZone(abbreviation: Util.getSystemTimeZone())!
        dateFormatter.dateFormat = "dd"
        //        NSTimeZone.default = TimeZone(abbreviation: "BST")!
        //       NSTimeZone.default = TimeZone(abbreviation: Util.getSystemTimeZone())!
        
        dateFormatter.dateFormat = "dd"
        
        dateFormatter.timeZone = NSTimeZone.default
        let toReturn: String = dateFormatter.string(from: self)
        return toReturn
    }
    
    func  getDayShortNameAndDate() -> String {
        let dayStr = self.shortNameOfDayFromDate()
        let dateStr = self.dayFromDate()
        
        let toReturn: String = String(format:"%@ %@", dayStr, dateStr)
        return toReturn
    }
    
    func  dayFromDate() -> String {
        
        let cal = Calendar.current
        let date = self // cal.startOfDay(for: Date())
        let day: Int = cal.component(.day, from: date)
        let dayString: String = String.init(day)
        return dayString
    }
    
    func  timeFromDate() -> String {
        
        let cal = Calendar.current
        let date = self // cal.startOfDay(for: Date())
        _ = cal.component(.hour, from: date)
        _ = cal.component(.minute, from: date)
        return ""
    }
    
    func  getDateInFormat(format: String?) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone.default
        let toReturn: String = dateFormatter.string(from: self)
        return toReturn
    }
    
//    func getTimeAsLong() -> Double {
//        let EventStartTime = self.getDateInFormat(format: LNConstants.TM_DATEFORMATS.TM_TIME_24HR)
//        var tmpVal = EventStartTime.split(separator: ":")
//        tmpVal.removeLast()
//        let str = tmpVal.joined(separator: "")
//        return double_t(str) ?? 0
//    }
    
//    func getDateAsLong() -> Double {
//        let EventStartTime = self.getDateInFormat(format: LNConstants.TM_DATEFORMATS.TM_SHORT_DATE)
//        let tmpVal = EventStartTime.split(separator: "-")
//        let str = tmpVal.joined(separator: "")
//        return double_t(str) ?? 0
//    }
    
    func days(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.day], from: sinceDate, to: self).day
    }
    
    func hours(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.hour], from: sinceDate, to: self).hour
    }
    
    var minute: Int {
        let calendar = Calendar.current
        let componet = calendar.dateComponents([.minute], from: self)
        return componet.minute ?? 0
    }
    
    var hour: Int {
        let calendar = Calendar.current
        let componet = calendar.dateComponents([.hour], from: self)
        return componet.hour ?? 0
    }
    
    var day: Int {
        let calendar = Calendar.current
        let componet = calendar.dateComponents([.day], from: self)
        return componet.day ?? 0
    }
    
    var month: Int {
        let calendar = Calendar.current
        let componet = calendar.dateComponents([.month], from: self)
        return componet.month ?? 0
    }
    
    var year: Int {
        let calendar = Calendar.current
        let componet = calendar.dateComponents([.year], from: self)
        return componet.year ?? 0
    }
    
    /**
     Adds given number of months to the date
     - Parameter month: number of months to be added
     - Returns: - date: calculated date
     */
    
    func addMonth(month: Int) -> Date {
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: .month, value: month, to: self )
        return newDate ?? Date()
    }
    
    /**
     Converts date string to Date
     - Parameter toDate: date 2(optional)
     - Returns: String - String with month and year of given dates
     */
//    func getMonthYearString(toDate: Date?=nil) -> String {
//        var monthYear = ""
//        if toDate == nil {
//            let dateFormatterForEntryDate = DateFormatter()
//            dateFormatterForEntryDate.dateFormat = LNConstants.TM_DATEFORMATS.TM_MONTH_YEAR
//            monthYear = dateFormatterForEntryDate.string(from: self)
//        } else if let endDate = toDate  {
//            let months = CalendarHelper.findMonthDifference(fromDate: self, toDate: endDate)
//            if months >= 1 {
//                let dateFormatterForEntryDate = DateFormatter()
//                dateFormatterForEntryDate.dateFormat = LNConstants.TM_DATEFORMATS.TM_MONTH_YEAR
//                let end = dateFormatterForEntryDate.string(from: endDate)
//                dateFormatterForEntryDate.dateFormat = LNConstants.TM_DATEFORMATS.TM_MONTH
//                let start = dateFormatterForEntryDate.string(from: self)
//                monthYear = "\(start), \(end)"
//            } else {
//                monthYear = self.getMonthYearString(toDate: nil)
//            }
//        }
//
//        return monthYear
//    }
//
    /**
     Converts date string to Date
     - Parameter toDate: date
     - Returns: String - String with date month and year of given dates
     */
    func getDateAsKey() -> String {
        return "\(self.day)\(self.month)\(self.year)"
    }
    
    /**
     Finds total number of days in a month
     - Parameter date: Any date in a month
     - Returns:-  Int: specifiing total number of days in the month of given date
     */
    func numberOfDaysInMonth() -> Int {
        let calendar = Calendar.current
        if let range = calendar.range(of: .day, in: .month, for: self) {
            return range.count
        }
        return 0
    }
    
    
    /**
     Sets day in a date to 30/31/29, which is End of month
     - Parameter date: date to be modified
     - Returns:- date: modified date
     */
    func endOfMonth() -> Date {
        let calendar = Calendar.current
        var dt: Date?
        let doubleStr = String(format: "%.0f", (self.timeIntervalSinceReferenceDate)) // "3.14"
        dt = Date.init(timeIntervalSinceReferenceDate: Double(doubleStr)!)
        
        var component = calendar.dateComponents(in: TimeZone.current, from: dt!)
        component.hour = 0
        component.minute = 0
        component.second = 0
        component.day = self.numberOfDaysInMonth() // self.getNumberOfDaysInMonth(date: date)
        
        return calendar.date(from: component)!
    }
    
    /**
     Adds given number of days to specified date
     - Parameter  date: specific date in which days has to be added
     - Parameter days: number of days to be added
     - Returns: - date: calculated date
     */
    func addDays(days: Int) -> Date {
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: .day, value: days, to: self )
        return (newDate ?? Date()).setZeroTimeForDate()
    }
    
    /**
     Sets time in Date() to 0 for hr, min, sec
     - Parameter date: date to be modified
     - Returns:- date: modified date
     */
    func setZeroTimeForDate() -> Date {
        let calendar = Calendar.current
        var dt: Date?
        let doubleStr = String(format: "%.0f", (self.timeIntervalSinceReferenceDate)) // "3.14"
        dt = Date.init(timeIntervalSinceReferenceDate: Double(doubleStr)!)
        
        var component = calendar.dateComponents(in: TimeZone.current, from: dt!)
        component.hour = 0
        component.minute = 0
        component.second = 0
        
        return calendar.date(from: component)!
    }
    
    
    
    /**
     Sets time in Date() to end of date  for hr, min, sec
     - Parameter date: date to be modified
     - Returns:- date: modified date
     */
    func getEODTime() -> Date {
        let calendar = Calendar.current
        var dt: Date?
        let doubleStr = String(format: "%.0f", (self.timeIntervalSinceReferenceDate)) // "3.14"
        dt = Date.init(timeIntervalSinceReferenceDate: Double(doubleStr)!)
        
        var component = calendar.dateComponents(in: TimeZone.current, from: dt!)
        component.hour = 23
        component.minute = 59
        component.second = 59
        
        return calendar.date(from: component)!
    }
    
    /**
     Sets date to default value that can be used for timing
     - Parameter date: date to be modified
     - Returns:- date: modified date
     */
    mutating func setDefaultDate() {
        let calendar = Calendar.current
        
        let givenDateComponent = calendar.dateComponents(in: TimeZone.current, from: self)
        
        var component = calendar.dateComponents(in: TimeZone.current, from: Date())
        component.day = 1
        component.month = 1
        component.year = 2020
        component.hour = givenDateComponent.hour
        component.minute = givenDateComponent.minute
        component.second = 0
        component.nanosecond = 0
        self = self.getWithDefaultDate()
    }

    /**
     Sets date to default value that can be used for timing
     - Parameter date: date to be modified
     - Returns:- date: modified date
     */
    func getWithDefaultDate() -> Date {
        let calendar = Calendar.current

        let givenDateComponent = calendar.dateComponents(in: TimeZone.current, from: self)

        var component = calendar.dateComponents(in: TimeZone.current, from: Date())
        component.day = 1
        component.month = 1
        component.year = 2020
        component.hour = givenDateComponent.hour
        component.minute = givenDateComponent.minute
        component.second = 0
        component.nanosecond = 0
        return calendar.date(from: component)!
    }

    /// Method to set day
    /// - Parameter value: Value for dayaƒ© ƒcde cd
    mutating func setDay(value: Int) {
        let calendar = Calendar.current
        var givenDateComponent = calendar.dateComponents(in: TimeZone.current, from: self)
        givenDateComponent.day = value
        self = calendar.date(from: givenDateComponent)!
    }

    /// Method to change day month year of a date without updating other components
    /// - Parameter value: Month value
    mutating func setMonth(value: Int) {
        let calendar = Calendar.current
        var givenDateComponent = calendar.dateComponents(in: TimeZone.current, from: self)
        givenDateComponent.month = value
        self = calendar.date(from: givenDateComponent)!
    }

    /// Method to change year of a date without updating other components
    /// - Parameter value: value for year
    mutating func setYear(value: Int) {
        var component = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        component.year = value
        self = Calendar.current.date(from: component) ?? Date()
    }

    /// Method to change day month year of a date without updating other components
    /// - Parameters:
    ///   - dayVal: Value for day
    ///   - monthVal: value for month
    ///   - yearVal: value for year
    mutating func setDayMonthYear(day dayVal: Int, month monthVal: Int, year yearVal: Int) {
        var component = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        component.day = dayVal
        component.month = monthVal
        component.year = yearVal
        self = Calendar.current.date(from: component) ?? Date()
    }

    /**
     Sets day in a date to 1, which is start of month
     - Returns:- date: modified date
     */
    func getStartOfMonth() -> Date {
        let calendar = Calendar.current
        var dt: Date?
        let doubleStr = String(format: "%.0f", (self.timeIntervalSinceReferenceDate)) // "3.14"
        dt = Date.init(timeIntervalSinceReferenceDate: Double(doubleStr)!)
        
        var component = calendar.dateComponents(in: TimeZone.current, from: dt!)
        component.hour = 0
        component.minute = 0
        component.second = 0
        component.day = 1
        
        return calendar.date(from: component)!
    }
    
    /**
     Sets day in a date to 1, which is start of month
     - Returns:- date: modified date
     */
    func getEndOfMonth() -> Date {
        let calendar = Calendar.current
        var dt: Date?
        let doubleStr = String(format: "%.0f", (self.timeIntervalSinceReferenceDate)) // "3.14"
        dt = Date.init(timeIntervalSinceReferenceDate: Double(doubleStr)!)
        
        var component = calendar.dateComponents(in: TimeZone.current, from: dt!)
        component.hour = 0
        component.minute = 0
        component.second = 0
        component.day = self.numberOfDaysInMonth()
        
        return calendar.date(from: component)!
    }
    
    /**
     Finds start of week
     - Returns:- date: modified date
     */
    func getStartOfWeek() -> Date {
        let date = self
        let weekDayOfDate = (date.getWeekDayOfDate() - 1 ) * -1
        let newDate = date.addDays(days: weekDayOfDate)
        return newDate
    }
    
    /**
     Finds End of week   `
     - Returns:- date: modified date
     */
    func getEndOfWeek() -> Date {
        let date = self
        let weekDayOfDate = (7 - date.getWeekDayOfDate())
        let newDate = date.addDays(days: weekDayOfDate)
        return newDate
    }
    
    /**
     Sets the seconds in Date() to 0
     - Returns:- date: modified date
     */
    func setZeroSecondsForDate() -> Date? {
        
        let date = self
        let calendar = Calendar.current
        var dt: Date?
        let doubleStr = String(format: "%.0f", (date.timeIntervalSinceReferenceDate)) // "3.14"
        dt = Date.init(timeIntervalSinceReferenceDate: Double(doubleStr)!)
        
        var component = calendar.dateComponents(in: TimeZone.current, from: dt!)
        component.second = 0
        
        return calendar.date(from: component)
    }
    
    /**
     Finds week day starting of month for given date
     - Returns: - numeric value(1...7) v specifing weekday of Day 1 of given date's month
     */
    func getWeekDayOfMonthStart() -> Int {
        return  self.getStartOfMonth().getWeekDayOfDate()
    }
    
    /**
     Finds week day of given day
     - Parameter date: specific date to find weekday
     - Returns: - numeric value(1...7) v specifing weekday
     */
    func getWeekDayOfDate() -> Int {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.weekday, from: self)
    }
    
    /**
     Converts date string to Date
     - Parameter secondDatetoDate: date 2(optional)
     - Returns: String - String with month and year of given dates
     */
//    func getMonthYearString(secondDatetoDate toDate: Date?) -> String {
//        return self.getMonthYearString(toDate: toDate)
//    }
    
    /// Method that will return date string in user preffered format
    /// - Returns: Date string
//    func getAsPrefFormatString() -> String {
//        let dtFormat = DateFormatter()
//        dtFormat.dateFormat = Util.getPrefferedDateFormat()
//        return dtFormat.string(from: self)
//    }
    
    func  getUTCDateInFormat(format:String?) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let toReturn:String = dateFormatter.string(from: self)
        print(toReturn)
        return toReturn
    }
}
