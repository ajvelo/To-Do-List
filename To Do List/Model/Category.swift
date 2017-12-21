//
//  Category.swift
//  To Do List
//
//  Created by Andreas Velounias on 21/12/2017.
//  Copyright © 2017 Andreas Velounias. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name = ""
    let items = List<Item>()
}
