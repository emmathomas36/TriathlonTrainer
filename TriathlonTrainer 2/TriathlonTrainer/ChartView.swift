//
//  ChartView.swift
//  TriTrainerTest
//
//  Created by Emma Thomas on 11/1/22.
//

import SwiftUI

struct ChartView: View {
    
    @Binding var completePercentage: Double
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                   Circle()
                        .stroke(Color(.systemTeal), lineWidth: 60)
                   Circle()
                        .trim(from: 0, to: completePercentage)
                        .stroke(Color(.systemBlue), lineWidth: 60)
                        .overlay (
                            VStack {
                                Text("\(completePercentage * 100, specifier: "%.2f")%")
                                    .font(.largeTitle)
                                    .bold()
                                Text("Workouts Completed")
                                Text("\(100 - (completePercentage * 100), specifier: "%.2f")%")
                                    .font(.title2)
                                    .bold()
                                Text("Workouts Skipped")
                            }
                        )
                    
                } //zstack
                .frame(width: 300, height: 300)
                .padding(.bottom, 50)
                
                VStack(alignment: .leading) {
                    Text("You have completed \(completePercentage * 100, specifier: "%.2f")% of your workouts.")
                        .padding(.bottom)
                        .bold()
                    if(completePercentage < 0.75) {
                        Text("You are at risk of not reaching your goals. Try to complete at least 75% of your workouts.")
                    } else {
                        Text("You are on track to reach your goals! Try to stay above 75% completion.")
                    }
                }
            }
            .navigationTitle("Workout Progress")
        }
    }
}


