//
//  WorkoutDetailView.swift
//  TriTrainerTest
//
//  Created by Emma Thomas on 11/3/22.
//

import SwiftUI


struct WorkoutDetailView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var days: Days
    var day: Day
    @State var log: String = ""
    @State var week: String = ""
    @State var weekDay: String = ""
    @State var showAlert = false
    @State var disableButton = false
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                    Text("Workout 1")
                        .font(.title3)
                        .bold()
                    VStack(alignment: .leading) {
                        ForEach(day.workout1, id: \.self) { index in
                            if(index.contains("Warm") || index.contains("Cool") || index.contains("Main")) {
                                Text(index)
                                    .bold()
                                    .padding(.top, 5)
                            } else {
                                Text(index)
                            }
                        } //ForEach workout 1
                    } //vstack1

                }//section
                
                Section() {
                    Text("Workout 2")
                        .font(.title3)
                        .bold()
                    
                    VStack(alignment: .leading) {
                        ForEach(day.workout2, id: \.self) { index in
                            if(index.contains("Warm Up:") || index.contains("Cool Down:") || index.contains("Main Set:")) {
                                Text(index)
                                    .bold()
                                    .padding(.top, 5)
                            } else {
                                Text(index)
                            }
                        } //ForEach workout 2
                    } //vstack2

                } // section
                
                
                Section(header: Text("How was your workout?")) {
                    TextField("How was your workout?", text: $log)
                    Button {
                        self.weekDay = day.weekDay
                        self.week = day.week
                        self.addLog(log: self.log, week: self.week, weekDay: self.weekDay)
                        showAlert = true
                    } label: {
                        Text("Submit")
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Logging submitted"))
                    }

                }
                
            } // form
            .navigationTitle("Workout")
        } // nav stack
    } // body
    
    
    private func addLog(log: String, week: String, weekDay: String) {
        let task = LoggingItem(context: context)
        task.id = UUID()
        task.log = log
        task.week = week
        task.weekDay = weekDay
        
        do{
            try context.save()
        } catch {
            print(error)
        }
    }
    
}

//struct WorkoutDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutDetailView(context: Days().list.first!)
//    }
//}
