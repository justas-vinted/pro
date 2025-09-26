public protocol Journey {
    func start(completion: @escaping () -> Void)
}

public protocol AnonymousUserJourneyMaking {
    func make() -> Journey
}

public protocol MemberJourneyMaking {
    func make() -> Journey
}

public protocol AuthorizationJourneyMaking {
    func make(onLogIn: @escaping () -> Void,
              onSkip: @escaping () -> Void) -> Journey
}
