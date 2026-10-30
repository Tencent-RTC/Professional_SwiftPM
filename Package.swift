// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.


import PackageDescription

let package = Package(
    name: "Professional_SwiftPM",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Professional_SwiftPM",
            targets: ["Professional_SwiftPM"]),
        .library(
            name: "TXLiteAVSDK_ReplayKit",
            targets: ["TXLiteAVSDK_ReplayKitExt"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "TXLiteAVSDK_Professional",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.6/professional/13.6.0.21648/TXLiteAVSDK_Professional.xcframework.zip",
            checksum: "da8fc015ce56b53968c2b2d9b460c7441880f45f1d599b4bdd09f21c2e2ab8e0"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.6/professional/13.6.0.21648/TXFFmpeg.xcframework.zip",
            checksum: "e18c0eed4f3cac62d43ecaf5e386c2e82cf158aaf96fc388ad9da5b360534793"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.6/professional/13.6.0.21648/TXSoundTouch.xcframework.zip",
            checksum: "3c24f9f58550ae136023a4624ea4f3ebdd35ede09bf8d10dc608786de70171fa"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.6/professional/13.6.0.21648/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "11ecc1c8a8bb9afff8e8a102c2d65dd29902548335bb6a3ffb0ef1869b63e06f"
        ),
        .target(
            name: "Professional_SwiftPM",
            dependencies: [
                .target(name: "TXLiteAVSDK_Professional"),
                .target(name: "TXFFmpeg"),
                .target(name: "TXSoundTouch")
            ],
            sources: ["Professional_SwiftPM.swift"],
            linkerSettings: [
                .linkedFramework("ReplayKit"),
                .linkedFramework("VideoToolbox"),
                .linkedFramework("AVKit"),
                .linkedFramework("GLKit"),
                .linkedFramework("AssetsLibrary"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("Accelerate"),
                .linkedFramework("MetalKit"),
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("MetalPerformanceShaders"),
                .linkedLibrary("sqlite3.0"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv")
            ]
        ),
        .target(
            name: "TXLiteAVSDK_ReplayKit",
            dependencies: [
                .target(name: "TXLiteAVSDK_ReplayKitExt")
            ],
            sources: ["TXLiteAVSDK_ReplayKitExt.swift"]
        )
    ]
)
