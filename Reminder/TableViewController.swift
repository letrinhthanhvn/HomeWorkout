//
//  TableViewController.swift
//  AlarmTableView
//
//  Created by Thanh on 01/03/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

public var timeSetUp: [String] = []

public var weekdaySetUp: [String] = []

public var indexSave = 0

public var indexCancel = 0

class TableViewController: UITableViewController {
    
    private let cellId = "cellId"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CellTimer.self, forCellReuseIdentifier: cellId)
        
        setupNavigationBar()
        setupLeftButton()
        setupRightButton()
        
    }
    
    
    func setupNavigationBar() {
        self.title = "Đặt giờ"
        let tlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        tlabel.text = self.title
        tlabel.textColor = UIColor.white
        tlabel.font = UIFont(name: "Helvetica", size: 25.0)
        tlabel.backgroundColor = UIColor.clear
        tlabel.adjustsFontSizeToFitWidth = true
        tlabel.textAlignment = .center;
        self.navigationItem.titleView = tlabel
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 37/255, blue: 51/255, alpha: 1)

    }
    
    
    private func setupRightButton() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(setAction))
        
    }
    
    private func setupLeftButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        
        tableView.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    @objc func setAction() {
        self.present(SetTimeController(), animated: true, completion: nil) 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if timeSetUp.count == 0 {
            return 0
        } else {
            return timeSetUp.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CellTimer

        for i in 0...timeSetUp.count {
            if indexPath.row == i {
                cell.lblTime.text = timeSetUp[i]
                cell.dayLabel.text = weekdaySetUp[i]
            }
        }
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            timeSetUp.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
           
        }    
    }
    let index = 0
    
    var indexSavePrevious = 0
    
    var indexCancelPrevious = 0
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (indexSave - indexSavePrevious) == 0{
            tableView.reloadData()
        } else if (indexSave - indexSavePrevious) != 0 {
            let indexPath = IndexPath(row: timeSetUp.count - 1, section: 0)
            
            tableView.beginUpdates()
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
            view.endEditing(true)
            
            indexSavePrevious += 1
        } 
        
        
    }

}
