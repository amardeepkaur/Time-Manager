//
//  CalendarViewController.swift
//  TimeManager
//
//  Created by Amardeep on 23/02/22.
//  Copyright © 2022 Amardeep. All rights reserved.
//

import UIKit
import JTAppleCalendar

protocol EventChangable {
    func indexTapped(index: Int)
}

class CalendarViewController: UIViewController {

    let weekly = 1
    let monthly = 5
    var viewModel = CalendarViewModel()
    var rows = 1
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var calendarHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.rows = rows
        self.calendarHeight.constant = 58.33
        calendarView.ibCalendarDataSource = viewModel
        calendarView.ibCalendarDelegate = viewModel
        calendarView.scrollDirection = .horizontal
        calendarView.scrollingMode = .stopAtEachCalendarFrame
        calendarView.showsHorizontalScrollIndicator = false
        
        setUpSegmentView()
    }
    
    func setUpSegmentView() {
//        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        //segmentView.setTitleTextAttributes(titleTextAttributes, for: .normal)
        //segmentView.setTitleTextAttributes(titleTextAttributes, for: .selected)

        segmentView.tintColor = .white
    }
    
    @IBAction func eventChanged(_ sender: UISegmentedControl) {
        switch segmentView.selectedSegmentIndex {
            case 0:
                self.calendarHeight.constant = 58.33
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.layoutIfNeeded()
                }) { completed in
                    self.viewModel.rows = self.weekly
                    self.calendarView.reloadData(withanchor: Date())
                }
            case 1:
                self.calendarHeight.constant = 350.00
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.layoutIfNeeded()
                }) { completed in
                    self.viewModel.rows = self.monthly
                    self.calendarView.reloadData(withanchor: Date())
                }
            default:
                break
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
