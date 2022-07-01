// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOSTestDRSPM",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iOSTestDRSPM",
            targets: ["iOSTestDRSPM"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
        .binaryTarget(
            url: "https://github.com/ShamSundar17/iOSTestDRSPM/releases/download/None/DigitalReefSDK_None.zip",
            checksum: "c756112431058f2ea311139526c048277fe36459b8103738bc9e91fda2f869c7"
            checksum: ""
        ),
        .target(
            name: "iOSTestDRSPM",
            dependencies: [
                .target(name: "DigitalReefSDK")
            ],
            path:"Sources"),
        .testTarget(
            name: "iOSTestDRSPMTests",
            dependencies: ["iOSTestDRSPM"])
    ]
)
