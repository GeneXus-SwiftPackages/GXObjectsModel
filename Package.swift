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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "2.0.0-beta.24")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXObjectsModel-2.0.0-beta.24.xcframework.zip",
			checksum: "84ed63ddb7b94e679de8e0b86557d2fe03af7272de6f40bdbc49e8cb5fef1ce7"
		)
	]
)