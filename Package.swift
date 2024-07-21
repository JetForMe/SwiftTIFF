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
        .library(
            name: "SwiftGeoTIFF",
            targets: ["SwiftGeoTIFF"]),
    ],
    dependencies:
    [
		.package(url: "https://github.com/apple/swift-testing.git",					branch: "main"),
    ],
    targets:
    [
		.systemLibrary(name: "libtiff", pkgConfig: "libtiff-4", providers: [.brew(["libtiff"]), .apt(["libtiff-dev"])]),
		.systemLibrary(name: "libgeotiff", pkgConfig: "libgeotiff", providers: [.brew(["libgeotiff"]), .apt(["libgeotiff-dev"])]),
        .target(
            name: "libtiffShim",
            dependencies: ["libtiff", "libgeotiff"]		//	TODO: Break out GeoTIFF shims into separate module
		),
        .target(
            name: "SwiftTIFF",
            dependencies: ["libtiff", "libtiffShim"]
		),
        .target(
            name: "SwiftGeoTIFF",
            dependencies: ["SwiftTIFF", "libgeotiff", "libtiff", "libtiffShim"]
		),
        .testTarget(
            name: "SwiftTIFFTests",
            dependencies: ["SwiftTIFF", "SwiftGeoTIFF", "libtiffShim", "libgeotiff", .product(name: "Testing", package: "swift-testing")],
			resources: [ .copy("Resources") ]
        ),
    ]
)
