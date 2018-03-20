//
//  ExerciseDetailController.swift
//  HomeWorkouts
//
//  Created by Thanh on 31/01/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

class ExerciseDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let headerId = "headerId"
    
    private let cellId = "cellId"
    
    var exercise: Exercise? {
        didSet {
            navigationItem.title = exercise?.nameLevelExercise
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1)
        collectionView?.register(ExerciseDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(ExerciseDetailBody.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! ExerciseDetailHeader
//        header.numberLabel.text = exercise?.numberOfWorkout
        header.exercise = exercise
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let body = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ExerciseDetailBody
        
        body.nameExercise.text = exercise?.nameWorkouts![indexPath.item]
        body.numberOfReps.text = exercise?.numberOfReps![indexPath.item]
        return body
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
    let exerciseDetailScreen = ExerciseDetailScreen()

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        exerciseDetailScreen.controller = self
        exerciseDetailScreen.showScreen()
        exerciseDetailScreen.headerLabel.text = exercise?.nameWorkouts![indexPath.item]
    }
    
}

class ExerciseDetailHeader: BaseCell {
    
    var exercise: Exercise? {
        didSet {
            if let image = exercise?.imageName {
                imageView.image = UIImage(named: image)
            }
            numberLabel.text = exercise?.numberOfWorkout
        }
    }
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.image = UIImage(named: "chestImage1")
        return iv
    }()
    
    let numberLabel: UILabel = {
       let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 30)
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor(red: 28/255, green: 134/255, blue: 238/255, alpha: 1)
        return nameLabel
    }()
    
    let nameWorkout: UILabel = {
       let nameWorkout = UILabel()
        nameWorkout.translatesAutoresizingMaskIntoConstraints = false
        nameWorkout.text = "WORKOUTS"
        nameWorkout.textAlignment = .center
        nameWorkout.font = UIFont.systemFont(ofSize: 30)
        nameWorkout.textColor = UIColor.white
        return nameWorkout
    }()
    
    override func setupView() {
         super.setupView()
        addSubview(imageView)
        addSubview(numberLabel)
        addSubview(nameWorkout)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-100-[v0]-100-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": numberLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-60-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": numberLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-100-[v0]-100-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameWorkout]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0][v1]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": numberLabel, "v1": nameWorkout]))
        
    }
}

class ExerciseDetailBody: BaseCell {
    
//    var exercise: Exercise? {
//        didSet {
//            nameExercise.text = exercise?.nameWorkouts
//        }
//    }
    
    let equalLabel: UILabel = {
       let equalLabel = UILabel()
        equalLabel.translatesAutoresizingMaskIntoConstraints = false
        equalLabel.font = UIFont.systemFont(ofSize: 20)
        equalLabel.textAlignment = .center
        equalLabel.textColor = UIColor.gray
        equalLabel.text = "="
        return equalLabel
    }()
    
    let nameExercise: UILabel = {
        let nameExercise = UILabel()
        nameExercise.translatesAutoresizingMaskIntoConstraints = false
        nameExercise.font = UIFont.systemFont(ofSize: 20)
        nameExercise.textAlignment = .left
        return nameExercise
    }()
    
    let numberOfReps: UILabel = {
        let numberReps = UILabel()
        numberReps.translatesAutoresizingMaskIntoConstraints = false
        numberReps.font = UIFont.systemFont(ofSize: 15)
        numberReps.textAlignment = .left
        numberReps.textColor = UIColor.gray
        numberReps.text = "x 30"
        return numberReps
    }()
    
    override func setupView() {
         super.setupView()
        backgroundColor = UIColor.white
        addSubview(equalLabel)
        addSubview(nameExercise)
        addSubview(numberOfReps)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": equalLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": equalLabel]))
        
        addConstraints([NSLayoutConstraint(item: equalLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)])
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-60-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameExercise]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameExercise]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-60-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": numberOfReps]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(50)]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": numberOfReps]))
        
    }
    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
    }
}
