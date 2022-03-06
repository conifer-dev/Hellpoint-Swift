// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Hellpoint-Swift",
    dependencies: [
        .package(url: "https://github.com/STREGAsGate/Raylib.git", .branch("master")),
        .package(url: "https://github.com/conifer-dev/Aeni.git", .branch("main")),
        .package(url: "https://github.com/conifer-dev/Seuwichi.git", .branch("main"))
    ],
    targets: [
        .executableTarget(name: "Hellpoint-Swift", dependencies: ["Raylib", "Aeni", "Seuwichi"],
                resources: [.process("Resources")],
                swiftSettings: [.unsafeFlags(["-Xfrontend", "-entry-point-function-name", "-Xfrontend", "wWinMain"], .when(platforms: [.windows]))],
                linkerSettings: [.unsafeFlags(["-Xlinker", "/SUBSYSTEM:WINDOWS"], .when(platforms: [.windows]))])
    ]
)
