public protocol AppTask {
    func cancel()
}

public protocol AppFlow {
    static func start(onComplete: @escaping () -> Void) -> AppTask
}
