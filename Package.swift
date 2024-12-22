// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Pillow",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Pillow", targets: ["Pillow"])
    ],
    dependencies: [
        .package(url: "https://github.com/KivySwiftLink/ImageCore", from: "311.0.7"),
        .package(url: "https://github.com/KivySwiftLink/PythonSwiftLink", .upToNextMajor(from: "311.1.0")),
        .package(url: "https://github.com/KivySwiftLink/PythonCore", .upToNextMajor(from: "311.0.0"))
    ],
    targets: [
        .target(
            name: "Pillow",
            dependencies: [
        		.product(name: "libjpeg", package: "ImageCore"),
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
            url: "https://github.com/kivyswiftlink/Pillow/releases/download/311.0.7/libpillow.zip",
            checksum: "51ae283336ddfad635eff626b0605974116077014846a0fc0b27becb5653ab69"
        )
    ]
)

