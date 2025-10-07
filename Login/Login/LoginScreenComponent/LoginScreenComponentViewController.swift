import UIKit

internal class LoginScreenComponentViewController: UIViewController {
    private let apiClient: APIClient
    private var configuration: LoginScreenComponentConfiguration
    
    init(configuration: LoginScreenComponentConfiguration,
         apiClient: APIClient) {
        self.configuration = configuration
        self.apiClient = apiClient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginScreenComponentViewController: LoginScreenComponent {}
