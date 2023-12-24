// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SwiftZ3",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
        .library(
            name: "SwiftZ3",
            targets: ["SwiftZ3"]
        ),
        .library(
            name: "CZ3",
            targets: ["CZ3"]
        ),
        .executable(
            name: "SwiftZ3Sample",
            targets: ["SwiftZ3Sample"]
        ),
    ],
    targets: [
        .systemLibrary(
            name: "CZ3",
            providers: [
                .brew(["z3"]),
                .apt(["libz3-dev"])
            ]
        ),
        .target(
            name: "SwiftZ3",
            dependencies: ["CZ3"]
        ),
        .executableTarget(
            name: "SwiftZ3Sample",
            dependencies: ["SwiftZ3", "CZ3"]
        ),
        .testTarget(
            name: "SwiftZ3Tests",
            dependencies: ["SwiftZ3", "CZ3"]
        ),
    ],
    cLanguageStandard: .c99,
    cxxLanguageStandard: .cxx17
)
