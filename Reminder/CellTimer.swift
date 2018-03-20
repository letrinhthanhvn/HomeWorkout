//
//  CellTimer.swift
//  AlarmTableView
//
//  Created by Thanh on 02/03/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

class CellTimer: UITableViewCell {
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setupViewCell()
    }
    
    let lblTime: UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 30)
        lbl.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let switchBtn: UISwitch = {
       let switchBtn = UISwitch()
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return switchBtn
    }()
    
    let txtLabel: UILabel = {
       let txt = UILabel()
        txt.text = "Repeat remind me"
        txt.font = UIFont.systemFont(ofSize: 22)
//        txt.backgroundColor = .red
        txt.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        
        txt.translatesAutoresizingMaskIntoConstraints = false
        
        return txt
    }()
    
    let dayLabel:UILabel = {
       let lbl = UILabel()
//        lbl.backgroundColor = .green
        lbl.text = "Tue Thu Mon Wen"
        lbl.textAlignment = .right
        lbl.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let dividerLineInPerCell: UIView = {
       let dv = UIView()
        dv.backgroundColor = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
        
        dv.translatesAutoresizingMaskIntoConstraints = false
        
        return dv
    }()
    
    let dividerRow: UIView = {
       let dr = UIView()
        dr.translatesAutoresizingMaskIntoConstraints = false
        
        dr.backgroundColor = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
        
        return dr
    }()
    
    
    func setupViewCell() {
        
        addSubview(lblTime)
        addSubview(txtLabel)
        addSubview(dayLabel)
        addSubview(dividerLineInPerCell)
        addSubview(switchBtn)
        addSubview(dividerRow)
        
        // autoLayout
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(200)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblTime]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblTime]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": switchBtn]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": switchBtn]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dividerLineInPerCell]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-10-[v1(1)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblTime, "v1": dividerLineInPerCell]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dividerRow]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(4)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dividerRow]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(200)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": txtLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-10-[v1(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dividerLineInPerCell, "v1": txtLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-225-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dayLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-10-[v1(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dividerLineInPerCell, "v1": dayLabel]))
        
    }
    

}
