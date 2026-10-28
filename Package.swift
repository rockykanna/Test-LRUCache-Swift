// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Test-LRUCache-Swift",
    platforms: [.iOS(.v17)],
    products: [
        .executable(name: "ImageGallerySample", targets: ["ImageGallerySample"])
    ],
    targets: [
        .executableTarget(name: "ImageGallerySample")
    ]
)
