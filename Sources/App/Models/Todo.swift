//
//  Todo.swift
//  App
//
//  Created by 高松幸平 on 2018/12/10.
//

import FluentSQLite
import Vapor

final class Todo: SQLiteModel {
    var id: Int?
    var name: String
    var priority: Int
    
    init(id: Int? = nil, name: String, priority: Int) {
        self.id = id
        self.name = name
        self.priority = priority
    }
}

extension Todo: Content {}
extension Todo: SQLiteMigration {}
