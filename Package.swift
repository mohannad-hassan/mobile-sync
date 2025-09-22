// swift-tools-version:5.5
import PackageDescription

// Check environment variable for local development mode (defaults to false)
let useLocalBuild = ProcessInfo.processInfo.environment["QURAN_SYNC_LOCAL_BUILD"] == "true"

let package = Package(
    name: "QuranSync",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "QuranSync",
            targets: ["QuranSync"]
        )
    ],
    targets: useLocalBuild ? [
        .binaryTarget(
            name: "QuranSync",
            path: "umbrella/build/XCFrameworks/release/QuranSync.xcframework"
        )
    ] : [
        .binaryTarget(
            name: "QuranSync",
            url: "https://github.com/quran/mobile-sync/releases/download/v0.0.1/QuranSync.xcframework.zip",
            checksum: "6aaa834a312792fb4b3c9a8783bd035cd91039ee93ac16e453723b4c7220b781"
        )
    ]
)
