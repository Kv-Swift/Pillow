// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Pillow",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Pillow", targets: ["Pillow"])
    ],
    dependencies: [
        .package(url: "https://github.com/KivySwiftLink/ImageCore", from: "311.1.6"),
        .package(url: "https://github.com/KivySwiftLink/FreeType", from: "311.1.6"),
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
            url: "https://github.com/kivyswiftlink/Pillow/releases/download/311.1.6/libpillow.zip",
            checksum: "39cd0ac1bc031ca2bbd9e26f9b68a3fb352bae79a118b295538a6886da35fb74"
        )
    ]
)

