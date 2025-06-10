// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Pillow",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Pillow", targets: ["Pillow"])
    ],
    dependencies: [
        .package(url: "https://github.com/kv-swift/ImageCore", from: "311.1.19"),
        .package(url: "https://github.com/kv-swift/FreeType", from: "311.1.19"),
        .package(url: "https://github.com/kv-swift/PySwiftKit", .upToNextMajor(from: "311.0.0")),
        .package(url: "https://github.com/kv-swift/PythonCore", .upToNextMajor(from: "311.0.0"))
    ],
    targets: [
        .target(
            name: "Pillow",
            dependencies: [
        		.product(name: "libjpeg", package: "ImageCore"),
        		.product(name: "freetype", package: "FreeType"),
        		.target(name: "libpillow")
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
            url: "https://github.com/kv-swift/Pillow/releases/download/311.1.19/libpillow.zip",
            checksum: "3f596b04900eed42d5431238b8c954677b5e68792c67c93d95ed0c3413790a37"
        )
    ]
)

