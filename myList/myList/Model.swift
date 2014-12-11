//
//  Model.swift
//  myList
//
//  Created by Supakait Jangpungsir on 12/11/2557 BE.
//  Copyright (c) 2557 Supakait Jangpungsir. All rights reserved.
//

import UIKit
import CoreData

@objc(Model)

class Model: NSManagedObject {
    //entity
    @NSManaged var item: String
    @NSManaged var quanlity: String
    @NSManaged var info: String
   
}
