import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let todos = TodosController()
    router.get("/", use: todos.index)
}
