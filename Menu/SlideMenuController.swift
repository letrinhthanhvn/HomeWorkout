//
//  ViewController.swift
//  MenuHomeWorkouts
//
//  Created by Thanh on 23/02/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

class SlideMenuController: UITableViewController {

    private let nameImg = ["planIcon","reportIcon","reminderIcon","settingIcon"]
    private let listText = ["Traning Plans","Reports","Reminder","Settings"]
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(red: 31/255, green: 37/255, blue: 51/255, alpha: 1)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellId)
        
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    let imgSlideMenu: UIImageView = {

        let img = UIImageView()
        img.image = UIImage(named: "imageSildeMenu")
//        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        
        

        return img

    }()
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let uv = UIView()
        uv.addSubview(imgSlideMenu)
        
        imgSlideMenu.frame = CGRect(x: 0, y: 0, width: 250, height: 200)
        
        return uv
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameImg.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        
        cell.img.image = UIImage(named: nameImg[indexPath.row])
        cell.txt.text = listText[indexPath.row]
        
    
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        
        if indexPath.row == 0 {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "Trainging Plans") as! ExercisesController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        } else if indexPath.row == 1 {
            
        } else if indexPath.row == 2 {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        } else if indexPath.row == 3 {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "SettingsController") as! SettingsController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        
    }


}

