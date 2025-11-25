// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXObjectsModel",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXObjectsModel",
			targets: ["GXObjectsModelWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "4.1.0-beta.11")
	],
	targets: [
		.target(name: "GXObjectsModelWrapper",
				dependencies: [
					"GXObjectsModel",
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXObjectsModel",
			url: "https://pkgs.genexus.dev/iOS/beta/GXObjectsModel-4.1.0-beta.11.xcframework.zip",
			checksum: "e868a7ce8b09eb17da27b4f836043363daa43053fb0c0bc3a9c7931733c85c18"
		)
	]
)