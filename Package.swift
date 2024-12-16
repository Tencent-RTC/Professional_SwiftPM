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
            url: "https://liteav.sdk.qcloud.com/download/spm/12.2/professional/TXLiteAVSDK_Professional.xcframework.zip",
            checksum: "cc70cb51a25ac36fecc76dc9e49821badb10deb2afa3d766401d9965b54561ae"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.2/professional/TXFFmpeg.xcframework.zip",
            checksum: "d0104f4da1a2aef48eb5c52779c0cc7d401995f2ac9d1942940955299e877b10"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.2/professional/TXSoundTouch.xcframework.zip",
            checksum: "8d70e075253d49bf926befec4da567676654840a545eb4284669131d9c91d24e"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.2/professional/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "6735c24f1ae1a5acb75886b47eaa032ee4a99cd99fa0719638216721ddede152"
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