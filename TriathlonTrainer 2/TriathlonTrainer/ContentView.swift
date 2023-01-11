//
//  ContentView.swift
//  TriTrainerTest
//
//  Created by Emma Thomas
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var days: Days
    @State var completePercentage = UserDefaults.standard.double(forKey: "completePercentage")

    var body: some View {
        TabView {
            DashView(completePercentage: $completePercentage)
                .tabItem {
                    Image(systemName: "house.circle.fill")
                    Text("Home")
                }
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("All Workouts")
                }
            
            ChartView(completePercentage: $completePercentage)
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Progress")
                }
            
            LogView()
                .tabItem {
                    Image(systemName: "book.circle")
                    Text("Log Book")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Days())
    }
}

