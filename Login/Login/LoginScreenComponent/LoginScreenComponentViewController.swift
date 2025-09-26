import UIKit


internal class LoginScreenComponentViewController: UIViewController {
    private let urlRequestPerformer: URLRequestPerforming
    private var configuration: LoginScreenComponentConfiguration
    
    init(configuration: LoginScreenComponentConfiguration, urlRequestPerformer: URLRequestPerforming) {
        self.configuration = configuration
        self.urlRequestPerformer = urlRequestPerformer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginScreenComponentViewController: LoginScreenComponent {}
