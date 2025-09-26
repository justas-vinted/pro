import ProjectDescription

nonisolated(unsafe)
public let Application = ApplicationProject(
    name: "Application",
    dependencies: [
        Login,
        APIHelpers
    ]
)
