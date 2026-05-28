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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "4.2.0-beta.17")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXObjectsModel-4.2.0-beta.17.xcframework.zip",
			checksum: "ba46f3cee70ae5a66279f159e4a07381bd40c759b3998c4227a6cf20f43f4b40"
		)
	]
)