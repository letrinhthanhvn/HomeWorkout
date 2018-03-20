//
//  Cell.swift
//  HomeWorkouts
//
//  Created by Thanh on 30/01/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    var exerciseController: ExercisesController?
    
    var typeExercise: TypeExercise? {
        didSet {
            if let name = typeExercise?.nameExercise {
                label.text = name
            }
        }
    }
    
    private let cellId = "chestCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let chestCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    let label: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 15)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    func setupView() {
        backgroundColor = UIColor.white
        addSubview(label)
        addSubview(chestCollectionView)
        
        chestCollectionView.dataSource = self
        chestCollectionView.delegate = self
        
        chestCollectionView.register(ExerciseCell.self, forCellWithReuseIdentifier: cellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": label]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": label]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[v0]-12-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": chestCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": chestCollectionView]))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = typeExercise?.exercises?.count {
            return count
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ExerciseCell
        cell.exercise = typeExercise?.exercises?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - 24, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 0, 5, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let exercise = typeExercise?.exercises?[indexPath.item] {
            exerciseController?.showExerciseDetail(exercise: exercise)
        }
    }
}

class ExerciseCell: UICollectionViewCell {
    
    var exercise: Exercise? {
        didSet {
            levelText.text = exercise?.nameLevelExercise
            image.image = UIImage(named: (exercise?.imageName)!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var image: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "chestImage1")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let starImageWhite: UIImageView = {
       let starImage = UIImageView()
        starImage.image = UIImage(named: "starWhite")
        starImage.contentMode = .scaleAspectFill
        starImage.layer.masksToBounds = true
        starImage.translatesAutoresizingMaskIntoConstraints = false
        return starImage
    }()
    
    let starImageBlue: UIImageView = {
        let starImage = UIImageView()
        starImage.image = UIImage(named: "starBlue")
        starImage.contentMode = .scaleAspectFill
        starImage.layer.masksToBounds = true
        starImage.translatesAutoresizingMaskIntoConstraints = false
        return starImage
    }()
    
    
    var levelText: UILabel = {
       let text = UILabel()
        text.text = "CHEST BEGINNER"
        text.font = UIFont.systemFont(ofSize: 23)
        text.textAlignment = .right
        text.textColor = UIColor.white
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    func setupView() {
        addSubview(image)
        addSubview(levelText)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": image]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": image]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(300)]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": levelText]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(70)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": levelText]))
        
    }
}

