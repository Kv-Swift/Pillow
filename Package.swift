// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Pillow",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Pillow", targets: ["Pillow"])
    ],
    dependencies: [
        .package(url: "https://github.com/KivySwiftLink/ImageCore", from: "311.0.11"),
        .package(url: "https://github.com/KivySwiftLink/FreeType", from: "311.0.11"),
        .package(url: "https://github.com/KivySwiftLink/PythonSwiftLink", .upToNextMajor(from: "311.1.0")),
        .package(url: "https://github.com/KivySwiftLink/PythonCore", .upToNextMajor(from: "311.0.0"))
    ],
    targets: [
        .target(
            name: "Pillow",
            dependencies: [
        		.product(name: "libjpeg", package: "ImageCore"),
        		.product(name: "freetype", package: "FreeType"),
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
            url: "https://github.com/kivyswiftlink/Pillow/releases/download/311.0.11/libpillow.zip",
            checksum: "0a7efabe7c1a3389fda572b8b1dd9fd0f630da727611e5b4b1665fcb20b183e1"
        )
    ]
)

