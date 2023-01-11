//
//  DashView.swift
//  TriTrainerTest
//
//  Created by Emma Thomas
//

import SwiftUI

struct DashView: View {
    @EnvironmentObject var days: Days
    @State var dayIndex = UserDefaults.standard.integer(forKey: "dayIndex")
    @State var week = UserDefaults.standard.integer(forKey: "week")
    @State var disableButton = false
    @State var disablePreviousButton = false
    @State var disableNextButton = false
    @State var workoutsComplete = UserDefaults.standard.double(forKey: "workoutsComplete")
    @State var totalWorkouts = UserDefaults.standard.double(forKey: "totalWorkouts")
    @Binding var completePercentage: Double
    @State var complete = false
    @State var skip = false
    
    var body: some View {
        let currentDay = days.weeks[week].daysInWeek[dayIndex]
        NavigationStack {
            Form {
                Section(header: Text("\(currentDay.weekDay), Week \(week + 1)")
                    .font(.system(.title2))){
                    NavigationLink(destination: WorkoutDetailView(day: currentDay)) {
                        VStack(alignment: .leading) {
                            // not sure how I would get this to stay
                            if(complete) {
                                Text("Completed")
                                    .font(.caption)
                                    .foregroundColor(Color(.systemBlue))
                                    .padding(.bottom, 5)
                            }
                            if(skip) {
                                Text("Skipped")
                                    .font(.caption)
                                    .foregroundColor(Color(.systemBlue))
                                    .padding(.bottom, 5)
                            }
                            Text("Workout 1")
                                .font(.system(.title3))
                                .fontWeight(.bold)
                            Text(currentDay.workout1[0])
                                .foregroundColor(Color(.systemGray))
                                .padding(.bottom, 5)
                            Text("Workout 2")
                                .font(.system(.title3))
                                .fontWeight(.bold)
                            Text(currentDay.workout2[0])
                                .foregroundColor(Color(.systemGray))
                        } // vstack
                    } // nav link
                    Button {
                        disableButton = true
                        workoutsComplete += 1.0
                        totalWorkouts += 1.0
                        completePercentage = workoutsComplete / totalWorkouts
                        complete = true
                        UserDefaults.standard.set(workoutsComplete, forKey: "workoutsComplete")
                        UserDefaults.standard.set(totalWorkouts, forKey: "totalWorkouts")
                        UserDefaults.standard.set(completePercentage, forKey: "completePercentage")
                    } label: {
                        Text("Complete Workout")
                    }
                    .disabled(disableButton)
                        
                    Button {
                        skip = true
                        disableButton = true
                        totalWorkouts += 1.0
                        completePercentage = workoutsComplete / totalWorkouts
                        UserDefaults.standard.set(workoutsComplete, forKey: "workoutsComplete")
                        UserDefaults.standard.set(totalWorkouts, forKey: "totalWorkouts")
                        UserDefaults.standard.set(completePercentage, forKey: "completePercentage")
                    } label: {
                        Text("Skip Workout")
                    }
                    .disabled(disableButton)
                } // section
                
                
                
                Section(header: Text("Week \(week + 1) Workouts")
                    .font(.system(.title2))) {
                    ForEach(days.weeks[week].daysInWeek, id: \.self) { day in
                        NavigationLink(destination: WorkoutDetailView(day: day)) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(day.weekDay)
                                        .font(.system(.title3))
                                        .bold()
                                    if(day.weekDay.contains (currentDay.weekDay)) {
                                        Text("Today")
                                            .font(.caption)
                                            .foregroundColor(Color(.systemBlue))
                                    }
                                }
                                Text(day.workoutType)
                                    .foregroundColor(Color(.systemGray))
                            } //vstack
                        } //navlink
                    } //foreach
                } //section
            } // form
            .navigationTitle(Text("Dashboard"))
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button {
                        disableNextButton = false
                        if(dayIndex == 0) {
                            dayIndex = 6
                            week -= 1
                        } else {
                            dayIndex -= 1
                        }
                        if(week == 0 && dayIndex == 0) {
                            disablePreviousButton = true
                        }
                        UserDefaults.standard.set(dayIndex, forKey: "dayIndex")
                        UserDefaults.standard.set(week, forKey: "week")
        
                    } label: {
                        Text("Previous Day")
                    }
                    .disabled(disablePreviousButton)
                }
                //  UserDefaults.standard.set(favoritesArray, forKey: "favorites")

        
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button {
                        disablePreviousButton = false
                        disableButton = false
                        complete = false
                        skip = false
                        if(dayIndex == 6)  {
                            if(week == 3) {
                                disableNextButton = true
                            } else {
                                dayIndex = 0
                                week += 1
                            }
                        } else {
                            dayIndex += 1
                        }
                        UserDefaults.standard.set(dayIndex, forKey: "dayIndex")
                        UserDefaults.standard.set(week, forKey: "week")
                    } label: {
                        Text("Next Day")
                    }
                    .disabled(disableNextButton)
                } //toolbar
            }// form
            .onAppear() {
                if(week == 0 && dayIndex == 0) {
                    disablePreviousButton = true
                }
                if(week == 3 && dayIndex == 6) {
                    disableNextButton = false
                }
            }
        } //nav
    } // body
}
