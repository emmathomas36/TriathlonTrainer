//
//  TrainingWeek.swift
//  TriTrainerTest
//
//  Created by Emma Thomas on 11/18/22.
//

import Foundation


class Days: ObservableObject {
    
    //@Published var list: [Day] = []
    @Published var weeks: [Week] = []
    @Published var selectedDay: Day?
    @Published var list: [Day] = []
    
    init() {
        //load data
        if let path = Bundle.main.path(forResource: "data2", ofType: "plist") {
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String:Any]
                let tempArray = tempDict["weeks"] as! Array<Array<[String:Any]>>
                var tempWeeks: [Week] = []
                var tempAllDays: [Day] = []
                
                for week in tempArray {
                    var tempDays: [Day] = []
                    for day in week {
                        let workout1 = day["workout1"] as! [String]
                        let workout2 = day["workout2"] as! [String]
                        let workoutType = day["workoutType"] as! String
                        let week = day["week"] as! String
                        let weekDay = day["weekDay"] as! String
                        
                        let d = Day(workout1: workout1, workout2: workout2, weekDay: weekDay, week: week, workoutType: workoutType)
                        
                        tempAllDays.append(d)
                        tempDays.append(d)
                    }
                    let w = Week(daysInWeek: tempDays)
                    tempWeeks.append(w)
                }
                
                weeks = tempWeeks
                list = tempAllDays
                
            }
            catch {
                print(error)
            }
        }
    } // init
}
