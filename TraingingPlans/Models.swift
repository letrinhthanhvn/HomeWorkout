//
//  Models.swift
//  HomeWorkouts
//
//  Created by Thanh on 31/01/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

class Exercise: NSObject {
    var nameLevelExercise: String?
    var numberOfWorkout: String?
    var imageName: String?
    var nameWorkouts: [String]?
    var numberOfReps: [String]?
}

class TypeExercise: NSObject {
    var nameExercise: String?
    var exercises: [Exercise]?
    
    static func sampleTypeExercise() -> [TypeExercise] {
        
        // Tap nguc
        let chestExercise = TypeExercise()
        chestExercise.nameExercise = "CHEST"
        
        var typeChestExercises = [Exercise]() // cac level tap nguc
        
        
        // chest beginner
        let chestBeginner = Exercise()
        chestBeginner.nameLevelExercise = "CHEST BEGINNER"
        chestBeginner.numberOfWorkout = "5"
        chestBeginner.imageName = "chestImage1"
        chestBeginner.nameWorkouts = ["JUMPING JACKS","INCLINE PUSH-UPS","KNEE PUSH-UPS","PUSH-UPS","WIDE ARM PUSH-UPS"]
        chestBeginner.numberOfReps = ["x 30","x 16","x 12","x 10","x 10"]
        
        typeChestExercises.append(chestBeginner)
        
        
        
        
        // chest intermediate
        let chestIntermediate = Exercise()
        chestIntermediate.nameLevelExercise = "CHEST INTERMEDIATE"
        chestIntermediate.imageName = "chestImage2"
        chestIntermediate.numberOfWorkout = "6"
        chestIntermediate.nameWorkouts = ["JUMPING JACKS","KNEE PUSH-UPS","PUSH-UPS","WIDE ARM PUSH-UPS","HINDU PUSH-UPS","CORBA STRETCH"]
        chestIntermediate.numberOfReps = ["x 30","x 12","x 12","x 15","00:30","00:30"]
        typeChestExercises.append(chestIntermediate)
    
        
        
        // chest advanced
        let chestAdvanced = Exercise()
        chestAdvanced.nameLevelExercise = "CHEST ADVANCED"
        chestAdvanced.imageName = "chestImage3"
        chestAdvanced.numberOfWorkout = "6"
        chestAdvanced.nameWorkouts = ["JUMPING JACKS","KNEE PUSH-UPS","BURPEES","STAGGERED PUSH-UPS","HINDU PUSH-UPS","PUSH-UP & ROTATION"]
        chestAdvanced.numberOfReps = ["x 30","x 20","00:30","x 10","x 15","x 12"]
        typeChestExercises.append(chestAdvanced)
        
        chestExercise.exercises = typeChestExercises // mang chua cac level tap nguc
        
        
        
        
        // Tap bung
        let absExercise = TypeExercise()
        absExercise.nameExercise = "ABS"
        
        var typeAbsExercises = [Exercise]()
        
        // abs beginner
        let absBeginner = Exercise()
        absBeginner.nameLevelExercise = "ABS BEGINNER"
        absBeginner.numberOfWorkout = "6"
        absBeginner.imageName = "absImage1"
        absBeginner.nameWorkouts = ["JUMPING JACKS","ABDOMINAL CRUNCHES","RUSSIAN TWIST","MOUNTAIN CLIMBER","HEEL TOUCH","LEG RAISES"]
        absBeginner.numberOfReps = ["x 20","x 16","x 20","x 16","x 20","x 16"]
        typeAbsExercises.append(absBeginner)
        
        // abs intermedite
        let absIntermediate = Exercise()
        absIntermediate.nameLevelExercise = "ABS INTERMEDIATE"
        absIntermediate.imageName = "absImage2"
        absIntermediate.numberOfWorkout = "6"
        absIntermediate.nameWorkouts = ["JUMPING JACKS","ABDOMINAL CRUNCHES","RUSSIAN TWIST","MOUNTAIN CLIMBER","HEEL TOUCH","LEG RAISES"]
        absIntermediate.numberOfReps = ["x 20","x 16","x 20","x 16","x 20","x 16"]
        typeAbsExercises.append(absIntermediate)
        
        // abs Advanced
        let absAdvanced = Exercise()
        absAdvanced.nameLevelExercise = "ABS ADVANCED"
        absAdvanced.imageName = "absImage3"
        absAdvanced.numberOfWorkout = "5"
        absAdvanced.nameWorkouts = ["JUMPING JACKS","SIT-UPS","SIDE BRIDGES LEFT","SIDE BRIDGES RIGHT","ABDOMINAL CRUNCHES"]
        absAdvanced.numberOfReps = ["x 30","x 20","x 20","x 20","x 30"]
        typeAbsExercises.append(absAdvanced)
        
        absExercise.exercises = typeAbsExercises
        
        
        
        
        // tap vai va lung
        let sbExercise = TypeExercise()
        sbExercise.nameExercise = "SHOULDER & BACK"
        
        var typeShoulderBack = [Exercise]()
        
        // shoulder & back beginner
        let shoulderBackBeginner = Exercise()
        shoulderBackBeginner.nameLevelExercise = "SHOULDER & BACK BEGINNER"
        shoulderBackBeginner.imageName = "backImage1"
        shoulderBackBeginner.numberOfWorkout = "5"
        shoulderBackBeginner.nameWorkouts = ["JUMPING JACKS","ARM RAISES","RHOMBOID PULLS","SIDE ARM RAISE","KNEE PUSH-UPS"]
        shoulderBackBeginner.numberOfReps = ["x 30","x 16","x 14","x 16","00:30"]
        
        typeShoulderBack.append(shoulderBackBeginner)
        
        // shoulder & back intermediate
        let shoulderBackInter = Exercise()
        shoulderBackInter.nameLevelExercise = "SHOULDER & BACK INTERMEDIATE"
        shoulderBackInter.imageName = "backImage2"
        shoulderBackInter.numberOfWorkout = "5"
        shoulderBackInter.nameWorkouts = ["JUMPING JACKS","TRICEPS KICKBACKS","INCLINE PUSH-UPS","RHOMBOID PULLS","FLOOR TRICEP DIPS"]
        shoulderBackInter.numberOfReps = ["x 30","x 14","x 14","x 12","x 16"]
        
        typeShoulderBack.append(shoulderBackInter)
        
        // shoulder & back advanced
        let shoulderBackAdvanced = Exercise()
        shoulderBackAdvanced.nameLevelExercise = "SHOULDER & BACK ADVANCED"
        shoulderBackAdvanced.imageName = "backImage3"
        shoulderBackAdvanced.numberOfWorkout = "5"
        shoulderBackAdvanced.nameWorkouts = ["JUMPING JACKS","HYPEREXTENSION","PIKE PUSH-UPS","REVERSE PUSH-UPS","INCHWORMS"]
        shoulderBackAdvanced.numberOfReps = ["x 30","x 14","x 14","x 12","x 16"]
        
        typeShoulderBack.append(shoulderBackAdvanced)
        
        sbExercise.exercises = typeShoulderBack
        
        
        
        
        // tap chan
        let legExercise = TypeExercise()
        legExercise.nameExercise = "LEG"
        
        var typeLeg = [Exercise]()
        
        // leg beginner
        let legBeginner = Exercise()
        legBeginner.nameLevelExercise = "LEG BEGINNER"
        legBeginner.imageName = "legImage1"
        legBeginner.numberOfWorkout = "5"
        legBeginner.nameWorkouts = ["SIDE HOP","SQUATS","SQUATS","SIDE-Lying LEG LIFT LEFT","SIDE LEG CIRCLES RIGHT"]
        legBeginner.numberOfReps = ["x 30","x 12","x 25","x 10","x 20"]
        typeLeg.append(legBeginner)
        
        // leg intermediate
        let legIntermediate = Exercise()
        legIntermediate.nameLevelExercise = "LEG INTERMEDIATE"
        legIntermediate.imageName = "legImage2"
        legIntermediate.numberOfWorkout = "5"
        legIntermediate.nameWorkouts = ["JUMPING JACKS","SQUATS","SQUATS","SQUATS","FIRE HYDRANT LEFT"]
        legIntermediate.numberOfReps = ["x 30","x 12","x 12","x 12","x 12"]
        typeLeg.append(legIntermediate)
        
        // leg advanced
        let legAdvanced = Exercise()
        legAdvanced.nameLevelExercise = "LEG ADVANCED"
        legAdvanced.imageName = "legImage3"
        legAdvanced.numberOfWorkout = "5"
        legAdvanced.nameWorkouts = ["BURPEES","SQUATS","SQUATS","SQUATS","BOTTOM LEG LIFT LEFT"]
        legAdvanced.numberOfReps = ["x 10","x 14","x 14","x 14","x 20"]
        typeLeg.append(legAdvanced)
        
        legExercise.exercises = typeLeg
     
        return [chestExercise, absExercise, sbExercise, legExercise] // mang chua cac bai tap(chest, abs, shoulder & back, leg
    }
}




