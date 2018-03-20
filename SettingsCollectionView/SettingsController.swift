//
//  SettingsController.swift
//  sideOutMenu
//
//  Created by Thanh on 19/03/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {
    
    let cellId = "cellId"
    
    let tittle: [[String]] = [["Rest set", "Countdown Time", "Mute", "Voice guide", "Coach tips"],["Apple Health", "Health Data", "Remind me to workout every day", "Language options"],["Rate us", "Feedback", "Privacy policy"]]
    
    let imgName: [[String]] = [["restIcon", "timeIcon", "muteIcon", "voiceIcon"],["heartIcon", "addIcon", "reminderBlueIcon", "earthIcon"],["rateIcon", "feedbackIcon", "privacyIcon"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.register(CellForPerSection.self, forCellReuseIdentifier: cellId)
        
        setupNavigationBar()
        setupLeftButton()
    }
    
    func setupNavigationBar() {
        self.title = "Settings"
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
    
    
    private func setupLeftButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        
        tableView.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tittle[0].count
        } else if section == 1 {
            return tittle[1].count
        } else if section == 2 {
            return tittle[2].count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CellForPerSection
        
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.setupView(index: 1)
                cell.lblName2.text = "00:15"
            } else if indexPath.row == 1 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.setupView(index: 1)
                cell.lblName2.text = "15:00"
            } else if indexPath.row == 2 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.setupView(index: 2)
            } else if indexPath.row == 3 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.setupView(index: 2)
            } 
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.setupView(index: 2)
            } else if indexPath.row == 1 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.baseSetupView()
            } else if indexPath.row == 2 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.baseSetupView()
            } else if indexPath.row == 3 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.baseSetupView()
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.baseSetupView()
            } else if indexPath.row == 1 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.baseSetupView()
            } else if indexPath.row == 2 {
                cell.lblName.text = tittle[indexPath.section][indexPath.row]
                cell.img.image = UIImage(named: imgName[indexPath.section][indexPath.row])
                cell.baseSetupView()
            }
        }
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "WORKOUT"
        } else if section == 1 {
            return "GENERAL SETTINGS"
        } else if section == 2 {
            return "SUPPORT US"
        }
        
        return ""
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
