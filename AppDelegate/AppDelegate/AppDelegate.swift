import UIKit

public final class ApplicationDelegate<Flow: AppFlow>: NSObject, UIApplicationDelegate {
    private var appTask: AppTask?
    var session = 0
    
    public func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        start()
        return true
    }
    
    private func start() {
        print("Starting app session # \(session)")
        session += 1
        appTask = Flow.start { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self?.start()
            }
        }
    }
}
