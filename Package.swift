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
        
        .binaryTarget(name: "DigitalReefSDK",
                      url: "https://github.com/ShamSundar17/iOSTestDRSPM/releases/download/4.4.3/DigitalReefSDK_4.4.3.zip",
                      checksum: "ca040a5a7c7aabf458d06f4296982fa2e3d6ec35616e84d633fedd8c01068cfa"),
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
