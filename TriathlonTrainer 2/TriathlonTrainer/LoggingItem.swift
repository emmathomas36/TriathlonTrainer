//
//  LoggingItem.swift
//  TriTrainerTest
//
//  Created by Emma Thomas on 12/1/22.
//

import CoreData
import Foundation
// if u create the entity manually, must set the class module to current product module
// and set the class codegen to manual/none or the file wont be found
// have to store the int in the database, only will take raw values. not named priority cuz of naming conflict

// model class for coredata
// must match properties/attributes in model
class LoggingItem: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var week: String
    @NSManaged public var weekDay: String
    @NSManaged public var log: String
}

