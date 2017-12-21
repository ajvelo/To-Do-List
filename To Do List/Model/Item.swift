//
//  Item.swift
//  To Do List
//
//  Created by Andreas Velounias on 21/12/2017.
//  Copyright © 2017 Andreas Velounias. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var done = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
