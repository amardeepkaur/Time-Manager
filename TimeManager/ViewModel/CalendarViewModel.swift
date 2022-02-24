//
//  CalendarViewModel.swift
//  TimeManager
//
//  Created by Amardeep on 23/02/22.
//  Copyright © 2022 Amardeep. All rights reserved.
//

import Foundation
import JTAppleCalendar

protocol CalendarViewModelDelegate {
    func refresh()
}

class CalendarViewModel {
    var rows = Int()
    
}

extension CalendarViewModel: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2022 01 01")!
        let endDate = Date()
        //return ConfigurationParameters(startDate: startDate, endDate: endDate)
//        return ConfigurationParameters(startDate: startDate,
//                                               endDate: endDate,
//                                               generateInDates: .forAllMonths,
//                                               generateOutDates: .tillEndOfGrid)
        if rows == 5 {
                return ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: rows)
            } else {
                return ConfigurationParameters(startDate: startDate,
                                               endDate: endDate,
                                               numberOfRows: rows,
                                               generateInDates: .forFirstMonthOnly,
                                               generateOutDates: .off,
                                               hasStrictBoundaries: false)
            }

    }
}

extension CalendarViewModel: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
//        cell.dateLabel.text = cellState.text
            return cell

    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
            let cell = cell as! DateCell
//            cell.dateLabel.text = cellState.text
        configureCell(view: cell, cellState: cellState)

    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        if #available(iOS 15.0, *) {
            print("selected date: \(date.formatted()) ")
        } else {
            // Fallback on earlier versions
        }
    }
    

    func configureCell(view: JTAppleCell?, cellState: CellState) {
       guard let cell = view as? DateCell  else { return }
       cell.dateLabel.text = cellState.text
       handleCellTextColor(cell: cell, cellState: cellState)
    }
        
    func handleCellTextColor(cell: DateCell, cellState: CellState) {
       if cellState.dateBelongsTo == .thisMonth {
          cell.dateLabel.textColor = UIColor.black
       } else {
//           cell.isHidden = true
          cell.dateLabel.textColor = UIColor.gray
       }
    }

    
}
