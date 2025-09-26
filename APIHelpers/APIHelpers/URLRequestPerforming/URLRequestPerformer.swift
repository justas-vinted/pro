import Foundation

public struct URLRequestPerformer: URLRequestPerforming {
    private let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    public func perform(request: URLRequest,
                        onComplete: @escaping (Data?, URLResponse?, (any Error)?) -> Void) -> any URLRequestTask {
        Task(
            session.dataTask(
                with: request, completionHandler: onComplete
            )
        )
    }
}

extension URLRequestPerformer {
    private class Task: URLRequestTask {
        let urlSessionDataTask: URLSessionDataTask
        
        init(_ urlSessionDataTask: URLSessionDataTask) {
            self.urlSessionDataTask = urlSessionDataTask
        }
        
        func cancel() {
            urlSessionDataTask.cancel()
        }
    }
}
