import Login
import API

extension LoginScreenComponentFactory {
    init() {
        self.init(
            apiClient: APIClientFactory().make()
        )
    }
}
