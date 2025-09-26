import ProjectDescription

public struct ApplicationProject {
    let name: String
    let executable: Target
    
    init(name: String, dependencies: [FeatureProject]) {
        self.name = name
        self.executable = .target(
            name: name,
            destinations: .iOS,
            product: .app,
            bundleId: name + ".lib",
            buildableFolders: [.folder("./\(name)/")],
            dependencies: dependencies.map { project in
                TargetDependency.project(
                    target: project.library.name,
                    path: project.path,
                    status: .required,
                    condition: nil
                )
            }
        )
    }
    
    public func build() -> Project {
        Project(name: name, targets: [executable])
    }
}
