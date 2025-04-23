// swift-tools-version: 6.0
import PackageDescription

#if TUIST
import struct ProjectDescription.PackageSettings

let packageSettings = PackageSettings(
    productTypes: [
        "RxSwift": .staticFramework,
        "RxCocoa": .staticFramework,
        "RxRelay": .staticFramework
    ]
)
#endif

let package = Package(
    name: "RxSwiftDemo",
    products: [
        .library(name: "RxSwiftDemo", targets: ["RxSwiftDemo"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "6.6.0") // 안정적인 버전으로 변경
    ],
    targets: [
        .target(
            name: "RxSwiftDemo",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxRelay", package: "RxSwift")
            ]
        )
    ]
)
