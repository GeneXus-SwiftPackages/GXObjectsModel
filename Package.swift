// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXObjectsModel",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXObjectsModel",
			targets: ["GXObjectsModelWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "2.0.12")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXObjectsModel-2.0.12.xcframework.zip",
			checksum: "be5b73639b7c193598c45fa15e1f7399f38b95692c36b19a872e4a2e6c6ddf78"
		)
	]
)