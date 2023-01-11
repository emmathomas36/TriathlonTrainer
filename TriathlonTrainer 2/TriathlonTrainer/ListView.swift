//
//  ListView.swift
//  TriTrainer
//
//  Created by Emma Thomas on 12/6/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var days: Days
    
    var body: some View {
        NavigationStack {
            List(days.list) { day in
                NavigationLink(destination: WorkoutDetailView(day: day)) {
                    VStack(alignment: .leading) {
                        Text("Week \(day.week) \(day.weekDay)")
                            .font(.title3)
                            .bold()
                        Text(day.workoutType)
                            .foregroundColor(Color(.systemGray))
                    } //vstack
                } //nav link
            } // list
            .navigationTitle(Text("All Workouts"))
        } // nav stack
    } // body
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
