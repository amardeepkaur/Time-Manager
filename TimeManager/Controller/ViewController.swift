//
//  ViewController.swift
//  TimeManager
//
//  Created by M_AMBIN03853 on 22/01/22.
//  Copyright © 2022 Amardeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var employeeTableView: UITableView!
    var empList = ["John Doe", "Jennifer", "Henry", "Nate", "Chuck", "Serena", "Blair", "Dan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        employeeTableView.register(UINib(nibName: "EmployeeCell", bundle: nil), forCellReuseIdentifier: "employee")
        getWeeklyDates()
    }
    
    func getWeeklyDates() {
        let dateInWeek = Date()//27 Jan 2022
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: dateInWeek)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: dateInWeek)!
        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: dateInWeek) }

        print(days)
    }
    
    //MARK: TablevView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employee", for: indexPath) as? EmployeeCell
        cell?.nameLabel?.text = empList[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        navigationController?.pushViewController(detailsController, animated: true)
    }


}

