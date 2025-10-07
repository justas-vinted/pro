import API

public struct LoginScreenComponentFactory {
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func make(_ configuration: LoginScreenComponentConfiguration) -> LoginScreenComponent {
        LoginScreenComponentViewController(
            configuration: configuration,
            apiClient: apiClient
        )
    }
}
