import Foundation

public protocol APIClientTask {
    func cancel()
}

public protocol APIClient {
    func perform(request: URLRequest,
                 onComplete: @escaping (Data?, URLResponse?, Error?) -> Void) -> APIClientTask
}
