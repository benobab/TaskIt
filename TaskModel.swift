//
//  TaskModel.swift
//  TaskIt
//
//  Created by BenLacroix on 14/12/2014.
//  Copyright (c) 2014 Benobab. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)//permet d'utiliser cette classe en objective C un jour si besoin
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var task: String
    @NSManaged var subTask: String
    @NSManaged var date: NSDate

}
