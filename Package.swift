// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXObjectsModel",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXObjectsModel",
			targets: ["GXObjectsModelWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.0.0-beta.20230704132152"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "1.0.0-beta.20230704132152")
	],
	targets: [
		.target(name: "GXObjectsModelWrapper",
				dependencies: [
					"GXObjectsModel",
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS, .tvOS, .watchOS])),
					.product(name: "YAJL", package: "YAJL", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXObjectsModel",
			url: "https://pkgs.genexus.dev/iOS/beta/GXObjectsModel-1.0.0-beta.20230704132152.xcframework.zip",
			checksum: "769e921cb614938ba5cd75ba33e9b76a530e82a58f5e4d6b272671d57fb4892b"
		)
	]
)