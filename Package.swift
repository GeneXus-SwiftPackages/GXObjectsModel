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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", 74dde0711a4fa381198959e514e0bb2c76016d09),
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", 1b467c9562bc71d67b84952ce802ff27e0c33b9a)
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXObjectsModel-1.0.0-beta+20230608211628.xcframework.zip",
			checksum: "d5abea285beb004600f6ce4e0840a87d94f980571dc84fd3f8bc068f7555a914"
		)
	]
)