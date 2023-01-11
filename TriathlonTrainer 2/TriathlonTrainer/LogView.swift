//
//  LogView.swift
//  TriTrainerTest
//
//  Created by Emma Thomas on 11/1/22.
//

import SwiftUI

struct LogView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: LoggingItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \LoggingItem.weekDay, ascending: false)])
    
    var loggingItems: FetchedResults<LoggingItem>
    
    @State private var newLog: String = ""
    @State private var newWeek: String = ""
    @State private var newWeekDay: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    ForEach(loggingItems, id: \.self) { loggingItem in
                        LogViewRow(loggingItem: loggingItem)
                    }
                    .onDelete(perform: deleteTask)
                }
            }
            .navigationTitle("Logging")
        }
    }
    
    private func deleteTask(indexSet: IndexSet) {
        for index in indexSet {
            let itemToDelete = loggingItems[index]
            context.delete(itemToDelete)
        }
        DispatchQueue.main.async {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}


struct LogViewRow: View {
    @Environment(\.managedObjectContext) var context
    
    @ObservedObject var loggingItem: LoggingItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Week \(self.loggingItem.week) \(self.loggingItem.weekDay)")
                .bold()
            Text(self.loggingItem.log)
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
