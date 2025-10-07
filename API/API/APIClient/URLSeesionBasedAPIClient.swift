import Foundation

internal struct URLSeesionBasedAPIClient: APIClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func perform(request: URLRequest,
                 onComplete: @escaping (Data?, URLResponse?, (any Error)?) -> Void) -> any APIClientTask {
        Task(
            session.dataTask(
                with: request, completionHandler: onComplete
            )
        )
    }
}

extension URLSeesionBasedAPIClient {
    private class Task: APIClientTask {
        let urlSessionDataTask: URLSessionDataTask
        
        init(_ urlSessionDataTask: URLSessionDataTask) {
            self.urlSessionDataTask = urlSessionDataTask
        }
        
        func cancel() {
            urlSessionDataTask.cancel()
        }
    }
}
