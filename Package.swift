// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAdPlug",
    products: [
        .library(name: "SwiftAdPlug", targets: ["SwiftAdPlug"]),
    ],
    targets: [
        .systemLibrary(
            name: "CppBinio", 
            pkgConfig: "libbinio", 
            providers: [
                .apt(["libbinio-dev"]),
                .brew(["libbinio"])
            ]
        ),
        .systemLibrary(
            name: "CppAdPlug", 
            pkgConfig: "adplug", 
            providers: [
                .apt(["libadplug-dev"]),
                .brew(["adplug"])
            ]
        ),
        .target(name: "CAdPlug", dependencies: ["CppAdPlug", "CppBinio"]),
        .target(name: "SwiftAdPlug", dependencies: ["CAdPlug"])
    ]
)
