import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let todos = TodosController()
    
    router.get { req in
        req.redirect(to: "/todos", type: .permanent)
    }
    router.get("/todos", use: todos.index)
    router.get("todos/new") { (req: Request) -> EventLoopFuture<View> in
        return try req.view().render("Todos/new")
    }
    router.post("/todos", use: todos.create)
}
