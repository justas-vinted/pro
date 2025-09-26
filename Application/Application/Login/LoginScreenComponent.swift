import Login
import APIHelpers

extension LoginScreenComponentFactory {
    init() {
        self.init(
            urlRequestPerformer: URLRequestPerformer(session: .shared)
        )
    }
}

