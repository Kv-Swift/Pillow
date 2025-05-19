// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Pillow",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Pillow", targets: ["Pillow"])
    ],
    dependencies: [
        .package(url: "https://github.com/KivySwiftLink/ImageCore", from: "311.1.9"),
        .package(url: "https://github.com/KivySwiftLink/FreeType", from: "311.1.9"),
        .package(url: "https://github.com/KivySwiftLink/PySwiftKit", .upToNextMajor(from: "311.0.0")),
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
            url: "https://github.com/kivyswiftlink/Pillow/releases/download/311.1.9/libpillow.zip",
            checksum: "dfde650bb3a1047373919972d25d000c34607e0c4a37333f9819142b5460a547"
        )
    ]
)

