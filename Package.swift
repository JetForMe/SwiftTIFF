// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTIFF",
	platforms: [ .macOS(.v12), .iOS(.v15) ],
    products:
    [
        .library(
            name: "SwiftTIFF",
            targets: ["SwiftTIFF"]),
    ],
    targets:
    [
		.systemLibrary(name: "libtiff", pkgConfig: "libtiff-4", providers: [.brew(["libtiff"]), .apt(["libtiff-dev"])]),
        .target(
            name: "SwiftTIFF",
            dependencies: ["libtiff"]
		),
        .testTarget(
            name: "SwiftTIFFTests",
            dependencies: ["SwiftTIFF"]
        ),
    ]
)
