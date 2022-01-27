//
//  Date+.swift
//  TimeManager
//
//  Created by M_AMBIN03853 on 27/01/22.
//  Copyright © 2022 Amardeep. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    func nextMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }
    
    func previousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    func getMonthName(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: date)
        return nameOfMonth
    }
    
    func getYear(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: date)
        return year
    }
    
    

    
}
