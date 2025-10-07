import API

extension APIClientFactory {
    
    init() {
        self.init(session: .shared)
    }
}
