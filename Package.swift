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
            url: "https://liteav.sdk.qcloud.com/download/spm/13.5/professional/13.5.0.21355/TXLiteAVSDK_Professional.xcframework.zip",
            checksum: "f4a91b1e7b88048f0bed1ef957b6e6c97edd501e3208ab41c0a6a7d234a22422"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.5/professional/13.5.0.21355/TXFFmpeg.xcframework.zip",
            checksum: "ad2de40540f577a2d283994b5c8f1fc71a05587ee558abba29fe1b0664d8ac3c"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.5/professional/13.5.0.21355/TXSoundTouch.xcframework.zip",
            checksum: "47804c696bda88278ae42ddbd7e4c4fc5b03ad3c0b0ccda5fc0e9a126d9eef0a"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.5/professional/13.5.0.21355/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "d7e62f5cee88057760adc8e726a80a9f035871fa8a9c996848f7e044e3e8ed6c"
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
