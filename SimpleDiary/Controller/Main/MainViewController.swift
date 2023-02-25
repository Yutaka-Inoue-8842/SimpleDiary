//
//  ViewController.swift
//  SimpleDiary
//
//  Created by Yutaka Inoue on 2023/02/25.
//

import UIKit
import FSCalendar

class MainController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var coverImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension MainController: FSCalendarDataSource {

    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "dd-MM-yyyy"
         guard let eventDate = dateFormatter.date(from: "24-02-2023") else { return 0 }

         if eventDate == date {
             return 1
         }
         return 0
     }

}

extension MainController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
}

