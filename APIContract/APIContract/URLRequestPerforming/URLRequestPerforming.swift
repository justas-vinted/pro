import Foundation

public protocol URLRequestTask {
    func cancel()
}

public protocol URLRequestPerforming {
    func perform(request: URLRequest,
                 onComplete: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLRequestTask
}
