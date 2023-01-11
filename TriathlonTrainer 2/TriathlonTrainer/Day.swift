//
//  Day.swift
//  TriTrainerTest
//
//  Created by Emma Thomas on 11/2/22.
//

import Foundation

class Day: NSObject, Identifiable {
    var id = UUID()
    var weekDay: String
    var workout1: [String]
    var workout2: [String]
    var week: String
    var workoutType: String
  
    init(workout1: [String], workout2: [String], weekDay: String, week: String, workoutType: String) {
        self.workout1 = workout1
        self.workout2 = workout2
        self.weekDay = weekDay
        self.week = week
        self.workoutType = workoutType
    }
}

class Week: NSObject, Identifiable {
    var daysInWeek: [Day]
    
    init(daysInWeek: [Day]) {
        self.daysInWeek = daysInWeek
    }

}
