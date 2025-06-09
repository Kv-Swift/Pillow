// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Pillow",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Pillow", targets: ["Pillow"])
    ],
    dependencies: [
        .package(url: "https://github.com/kv-swift/ImageCore", from: "311.1.17"),
        .package(url: "https://github.com/kv-swift/FreeType", from: "311.1.17"),
        .package(url: "https://github.com/kv-swift/PySwiftKit", .upToNextMajor(from: "311.0.0")),
        .package(url: "https://github.com/kv-swift/PythonCore", .upToNextMajor(from: "311.0.0"))
    ],
    targets: [
        .target(
            name: "Pillow",
            dependencies: [
        		.target(name: "libjpeg"),
        		.target(name: "freetype"),
        		"libpillow"
        	],
            resources: [
        	],
            linkerSettings: [
        		.linkedLibrary("z"),
        		.linkedLibrary("bz2")
        	],
            plugins: []
        ),
        .binaryTarget(
            name: "libpillow",
            url: "https://github.com/kv-swift/Pillow/releases/download/311.1.17/libpillow.zip",
            checksum: "377cd30ee1adecf8517b88c7d25d3b49b55745631b69d64e0234fed03eae9fde"
        )
    ]
)

