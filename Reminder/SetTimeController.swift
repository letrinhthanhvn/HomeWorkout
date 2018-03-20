//
//  SetTimeController.swift
//  AlarmTableView
//
//  Created by Thanh on 03/03/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

class SetTimeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    let choosen = true
    
    let weekDays = ["Every Monday","Every Tuesday","Every Wednesday","Every Thursday","Every Friday","Every Saturday","Every Sunday"]
    
    let shortWeekDays = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    
//    var timeData: [String] = []
    
    let picker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()
    
    let myTableView: UITableView = {
       let myTable = UITableView()
        myTable.translatesAutoresizingMaskIntoConstraints = false
        
        return myTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

        setupView()
        setupNaviBar()
    }
    
    
    func setupNaviBar() {
        let naviBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: 44)) // Offset by 20 pixels vertically to take the status bar into account
        
        naviBar.backgroundColor = .white
        //        naviBar.delegate = self as! UINavigationBarDelegate;
        
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = "Thêm Đặt Giờ"
        
        // Create left and right button for navigation item
        let leftButton =  UIBarButtonItem(title: "Huỷ", style:   UIBarButtonItemStyle.plain, target: self, action: #selector(setupActionForCancel))
        let rightButton = UIBarButtonItem(title: "Lưu", style: UIBarButtonItemStyle.plain, target: self, action: #selector(setupActionForSave))
        
        // Create two buttons for the navigation item
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        // Assign the navigation item to the navigation bar
        naviBar.items = [navigationItem]
        
        self.view.addSubview(naviBar)
        
    }
    
    @objc func setupActionForCancel() {
        indexCancel += 1
        dismiss(animated: true, completion: nil)
    }
    
    @objc func setupActionForSave() {
        indexSave += 1
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: picker.date)
        
        let minutes = calendar.component(.minute, from: picker.date)
        
        timeSetUp.append("\(hour) : \(minutes)")
        
        checkWeekday(myTableView)
        
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
   
    func setupView() {
        view.addSubview(picker)
        view.addSubview(myTableView)
        
        picker.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        picker.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        picker.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        picker.heightAnchor.constraint(equalToConstant: 225).isActive = true
        
        myTableView.topAnchor.constraint(equalTo: picker.bottomAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myTableView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        
        cell.textLabel?.text = weekDays[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    
    func checkWeekday(_ tableView: UITableView) {
        
//        var arrayWeekdays: [String] = []
        
        var weekdayLable = ""
        
        for i in 0..<7 {
            let indexPath = IndexPath(row: i, section: 0)
            if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
//                arrayWeekdays.append(shortWeekDays[i])
                print(shortWeekDays[indexPath.row])
                
                weekdayLable += " \(shortWeekDays[i])"
                
            }
        }
        
        
        
        weekdaySetUp.append(weekdayLable)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        tableView.cellForRow(at: indexPath!)?.accessoryType = UITableViewCellAccessoryType.checkmark
    }
    


}
