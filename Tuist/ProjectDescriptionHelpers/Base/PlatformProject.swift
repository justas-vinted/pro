import ProjectDescription

public struct PlatformProject {
    let name: String
    var library: Target
    
    init(name: String) {
        self.name = name
        
        self.library = .target(
            name: name,
            destinations: .iOS,
            product: .framework,
            bundleId: name + ".lib",
            buildableFolders: [.folder("./\(name)/")]
        )
    }
    
    public func build() -> Project {
        Project(name: name, targets: [library])
    }
    
    var path: Path { .relativeToRoot(name) }
}
