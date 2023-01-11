//
//  TriTrainerTestApp.swift
//  TriTrainerTest
//
//  Created by Emma Thomas on 10/6/22.
//

import SwiftUI

@main
struct TriTrainerApp: App {
    
    var days = Days()
    let persistanceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(days).environment(\.managedObjectContext, persistanceController.container.viewContext)
        }
    }
}
