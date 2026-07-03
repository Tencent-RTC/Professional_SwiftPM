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
            url: "https://liteav.sdk.qcloud.com/download/spm/13.4/professional/13.4.0.21067/TXLiteAVSDK_Professional.xcframework.zip",
            checksum: "400eefe26bb9d041cfbf0d9ccfbaadf306982f974a41a007806818d88319deac"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.4/professional/13.4.0.21067/TXFFmpeg.xcframework.zip",
            checksum: "4005fda7382df0b8c7d2f4b799270c3e2c74372025b8e7916b036905d764f40e"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.4/professional/13.4.0.21067/TXSoundTouch.xcframework.zip",
            checksum: "330a099c27ff6c357d8826dc040ba063dc8a4e65881e4a4ce9a8b2d7cafe6170"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.4/professional/13.4.0.21067/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "cecb7db1af4a33a0854c26b9109260de1c4eb42af533a5396b37516fd2adbf1a"
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
