// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = Version("1.41.0")

let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"

enum checksums {
    static let vi = "a4295166d2591521d604a0c5fc320b6773a65449348a4280c24eb269b24a6716"
}

let package = Package(
    name: "IdensicMobileSDK_VideoIdent",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "IdensicMobileSDK_VideoIdent",
            targets: [
                "VideoIdentWrapper"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SumSubstance/IdensicMobileSDK-iOS.git", .exact(version)),
        .package(url: "https://github.com/twilio/twilio-video-ios", "5.8.2" ..< "6.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "IdensicMobileSDK_VideoIdent",
            url: "\(gitUrl)/IdensicMobileSDK_VideoIdent-\(version).zip",
            checksum: checksums.vi
        ),
        .target(
            name: "VideoIdentWrapper",
            dependencies: [
                .product(name: "IdensicMobileSDK", package: "IdensicMobileSDK-iOS"),
                "IdensicMobileSDK_VideoIdent",
                .product(name: "TwilioVideo", package: "twilio-video-ios")
            ],
            path: "VideoIdentWrapper"
        )
    ]
)
