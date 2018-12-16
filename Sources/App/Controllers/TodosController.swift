//
//  TodosController.swift
//  App
//
//  Created by 高松幸平 on 2018/12/16.
//

import Vapor

final class TodosController {
    func index(_ req: Request) throws -> EventLoopFuture<View> {
        let todos = [Todo(name: "a", priority: 1), Todo(name: "b", priority: 1), Todo(name: "c", priority: 1)]
        return try req.view().render("Todos/index", ["todos": todos])
    }
}
