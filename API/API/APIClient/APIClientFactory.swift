import Foundation

public struct APIClientFactory {
    private let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    public func make() -> APIClient {
        URLSeesionBasedAPIClient(session: session)
    }
}

