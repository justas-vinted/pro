import ProjectDescription

public struct FeatureProject {
    let name: String
    var library: Target
    
    init(name: String, dependencies: [PlatformProject]) {
        self.name = name
        self.library = .target(
            name: name,
            destinations: .iOS,
            product: .staticFramework,
            bundleId: name + ".lib",
            buildableFolders: [ .folder("./\(name)/")],
            dependencies: dependencies.map { project in
                    .project(
                        target: project.library.name,
                        path: project.path,
                        status: .required,
                        condition: nil
                    )
            }
        )
    }
    
    public func build() -> Project {
        Project(name: name, targets: [library])
    }
    
    var path: Path { .relativeToRoot(name) }
}


public func extractFromPath(path: String = #filePath) -> String {
    String(path.replacing("/Project.swift", with: "").split(separator: "/").last!)
}
