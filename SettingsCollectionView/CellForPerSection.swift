//
//  CellForPerSection.swift
//  sideOutMenu
//
//  Created by Thanh on 19/03/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

class CellForPerSection: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let img: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        
        img.translatesAutoresizingMaskIntoConstraints = false
        
        
        return img
    }()
    
    let lblName: UILabel = {
        let lblName = UILabel()
        lblName.textColor = .black
//        lblName.backgroundColor = .gray
       
        lblName.translatesAutoresizingMaskIntoConstraints = false
        
        return lblName
    }()
    
    let lblName2: UILabel = {
        let lblName = UILabel()
        lblName.textColor = .gray
//        lblName.backgroundColor = .gray
        
        lblName.translatesAutoresizingMaskIntoConstraints = false
        
        return lblName
    }()
    
    let switchBtn: UISwitch = {
        let switchBtn = UISwitch()
        switchBtn.isOn = false
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return switchBtn
    }()
    
    func baseSetupView() {
        addSubview(img)
        addSubview(lblName)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v0(60)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": img]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": img]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-75-[v0]-75-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblName]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblName]))
    }
    
    
    func setupView(index: Int) {
        
        if index == 0 {
            baseSetupView()
        } else if index == 1 {
            baseSetupView()
            addSubview(lblName2)
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0][v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblName, "v1": lblName2]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblName2]))
            
        } else if index == 2 {
            baseSetupView()
            addSubview(switchBtn)
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0][v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblName, "v1": switchBtn]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": switchBtn]))
        }
    }
    
}
