//
//  DetailViewController.swift
//  TimeManager
//
//  Created by M_AMBIN03853 on 23/01/22.
//  Copyright © 2022 Amardeep. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var previousMonthBtn: UIButton!
    @IBOutlet weak var nextMonthBtn: UIButton!
    @IBOutlet weak var overtimeLabel: UILabel!
    @IBOutlet weak var overtimeHours: UILabel!
    @IBOutlet weak var leaveLabel: UILabel!
    @IBOutlet weak var leaveCount: UILabel!
    @IBOutlet weak var weeklyTableView: UITableView!
    
    var employeeName: String?
    var selectedDate: Date = Date()
    var arrayHeader = [1, 1, 1, 1]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
        weeklyTableView.register(UINib(nibName: "HeaderView", bundle: nibBundle), forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
    

    func setUpUI() {
        //TODO: show employee name on nav bar

        //Getting the current month's name
        let month = Date().getMonthName(date: Date())
        monthLabel.text = month
    }
    
    @IBAction func didSelectPreviousMonth(_ sender: Any) {
        settingUpPreviousAndNextMonth(value: -1)
    }
    
    @IBAction func didSelectNextMonth(_ sender: Any) {
        settingUpPreviousAndNextMonth(value: 1)
    }
    
    func settingUpPreviousAndNextMonth(value: Int) {
        var nextMonth = Date()
        nextMonth = Calendar.current.date(byAdding: .month, value: value, to: selectedDate) ?? Date()
        selectedDate = nextMonth
        let nameOfMonth = nextMonth.getMonthName(date: nextMonth)
        monthLabel.text = nameOfMonth
    }
    
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        headerView.contentView.backgroundColor = .separator
        headerView.weekLabel.text = "23rd Jan - 29th Jan"
        let button = UIButton(type: .custom)
        button.frame = headerView.bounds
        button.tag = section // Assign section tag to this button
        button.addTarget(self, action: #selector(tapSection(sender:)), for: .touchUpInside)
        headerView.addSubview(button)
        return headerView
    }
    
    @objc func tapSection(sender: UIButton) {
        self.arrayHeader[sender.tag] = (self.arrayHeader[sender.tag] == 0) ? 1 : 0
        self.weeklyTableView.reloadSections([sender.tag], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.arrayHeader[section] == 1) ? 0 : 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekCell", for: indexPath) as! WeeklyTableViewCell
        cell.weeklyDatesLabel.text = "hello"
        return cell
    }
    
    
}
