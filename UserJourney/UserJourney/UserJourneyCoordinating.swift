public class AnyUserJourney: Journey {
    private let anonymousUserJourneyFactory: AnonymousUserJourneyMaking
    private let memberJourneyFactory: MemberJourneyMaking
    private let authorizationJourneyFactory: AuthorizationJourneyMaking
    
    private var activeJourney: Journey?
    private var completion: (() -> Void)?
    
    public init(anonymousUserJourneyFactory: AnonymousUserJourneyMaking,
                memberJourneyFactory: MemberJourneyMaking,
                authorizationJourneyFactory: AuthorizationJourneyMaking) {
        self.anonymousUserJourneyFactory = anonymousUserJourneyFactory
        self.memberJourneyFactory = memberJourneyFactory
        self.authorizationJourneyFactory = authorizationJourneyFactory
    }
    
    public func start(completion: @escaping () -> Void) {
        print(#function)
        self.completion = completion
        showSplashScreen()
    }
    
    private func showSplashScreen() {
        print(#function)
        tryAuthorize()
    }
    
    private func tryAuthorize() {
        print(#function)
        var didAuthorize: Bool?
        activeJourney = authorizationJourneyFactory.make(
            onLogIn: { 
                didAuthorize = true
            },
            onSkip: {
                didAuthorize = false
            }
        )
        activeJourney?.start { [weak self] in
            if didAuthorize == nil {
                assertionFailure("Unexpected completion")
                self?.complete()
                return
            } else if didAuthorize == true {
                self?.startMemberJourney()
            } else {
                self?.startAnonymousJourney()
            }
            
        }
    }
    
    private func startMemberJourney() {
        print(#function)
        activeJourney = memberJourneyFactory.make()
        
        activeJourney?.start(
            completion: { [weak self] in
                self?.complete()
            }
        )
    }
    
    private func startAnonymousJourney() {
        print(#function)
        activeJourney = anonymousUserJourneyFactory.make()
        activeJourney?.start(
            completion: { [weak self] in
                self?.complete()
            }
        )
    }
    
    private func complete() {
        print(#function)
        completion?()
        completion = nil
    }
}
