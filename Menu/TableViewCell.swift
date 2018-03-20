//
//  TableViewCell.swift
//  MenuHomeWorkouts
//
//  Created by Thanh on 24/02/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.white : UIColor(red: 31/255, green: 37/255, blue: 51/255, alpha: 1)
            
            img.tintColor = isHighlighted ? UIColor(red: 31/255, green: 37/255, blue: 51/255, alpha: 1) : UIColor.white
            txt.textColor = isHighlighted ? UIColor(red: 31/255, green: 37/255, blue: 51/255, alpha: 1) : UIColor.white
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
//        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        backgroundColor = UIColor(red: 31/255, green: 37/255, blue: 51/255, alpha: 1)
        
        setupCell()
        // Configure the view for the selected state
    }
    
    
    let img: UIImageView = {
       let imageSymbol = UIImageView()
        imageSymbol.backgroundColor = UIColor.white
        imageSymbol.contentMode = .scaleAspectFit
        imageSymbol.layer.masksToBounds = true
        imageSymbol.translatesAutoresizingMaskIntoConstraints = false
        imageSymbol.backgroundColor = UIColor(red: 31/255, green: 37/255, blue: 51/255, alpha: 1)
        
        return imageSymbol
    }()
    
    let txt: UILabel = {
        
        let label = UILabel()
        label.text = "CHEST BEGINNER"
        label.font = UIFont.systemFont(ofSize: 23)
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    func setupCell() {
        addSubview(img)
        addSubview(txt)
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": img]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": img]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": txt]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": txt]))
    }

}
