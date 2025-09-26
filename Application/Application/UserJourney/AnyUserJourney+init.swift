import UserJourney

extension AnyUserJourney {
    convenience init() {
        self.init(
            anonymousUserJourneyFactory: DummyJourneyFactoryAdapter(factory: DummyJourneyFactory()),
            memberJourneyFactory: DummyJourneyFactoryAdapter(factory: DummyJourneyFactory()),
            authorizationJourneyFactory: DummyJourneyFactoryAdapter(factory: DummyJourneyFactory())
        )
    }
}

private struct DummyJourneyFactory {
    private struct Dummy: Journey {
        var onStart: () -> Void
        func start(completion: @escaping () -> Void) {
            onStart()
            completion()
        }
    }
    
    func make(onStart: @escaping () -> Void = {}) -> Journey {
        Dummy(onStart: onStart)
    }
    
}

private struct DummyJourneyFactoryAdapter: MemberJourneyMaking, AuthorizationJourneyMaking, AnonymousUserJourneyMaking {
    let factory: DummyJourneyFactory
    
    func make() -> any Journey {
        factory.make()
    }
    
    func make(onLogIn: @escaping () -> Void, onSkip: @escaping () -> Void) -> any Journey {
        factory.make(onStart: { onSkip()} )
    }
}

