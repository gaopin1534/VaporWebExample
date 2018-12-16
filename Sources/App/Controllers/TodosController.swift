//
//  TodosController.swift
//  App
//
//  Created by 高松幸平 on 2018/12/16.
//

import Vapor

final class TodosController {
    func index(_ req: Request) throws -> EventLoopFuture<View> {
        return try req.view().render("Todos/index", ["todos": Todo.query(on: req).all()])
    }
    
    func create(_ req: Request) throws -> EventLoopFuture<Response> {
        return try req.content.decode(Todo.self).map(to: Response.self, { todo in
            Todo.query(on: req).create(todo)
            return req.redirect(to: "/", type: .normal)
        })
    }
    
    func destroy(_ req: Request) throws -> EventLoopFuture<Response> {
        return try Todo.find(req.parameters.next(Int.self), on: req).map(to: Response.self) { todo in
            todo?.delete(on: req)
             return req.redirect(to: "/", type: .normal)
        }
    }
}
