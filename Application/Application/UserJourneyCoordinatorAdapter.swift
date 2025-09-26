import AppDelegate
import UserJourney
import Foundation

struct UserJourneyCoordinatorAdapter: AppFlow {
    private class JourneyTask: AppTask {
        private var journey: Any?
        
        init(journey: Journey) {
            self.journey = journey
        }
        
        func cancel() {
            journey = nil
        }
    }
    
    static func start(onComplete: @escaping () -> Void) -> any AppDelegate.AppTask {
        let journey = AnyUserJourney()
        
        journey.start(completion: onComplete)
        
        return JourneyTask(
            journey: journey
        )
    }
}
