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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.1.0-rc.5"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "1.1.0-rc.5")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXObjectsModel-1.1.0-rc.5.xcframework.zip",
			checksum: "d04546f7e14202c71a556afe3075745ac6bf36f9533a4957b4634b314e25f0a5"
		)
	]
)