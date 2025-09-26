public struct LoginScreenComponentFactory {
    private let urlRequestPerformer: URLRequestPerforming
    
    public init(urlRequestPerformer: URLRequestPerforming) {
        self.urlRequestPerformer = urlRequestPerformer
    }
    
    public func make(_ configuration: LoginScreenComponentConfiguration) -> LoginScreenComponent {
        LoginScreenComponentViewController(
            configuration: configuration,
            urlRequestPerformer: urlRequestPerformer
        )
    }
}
