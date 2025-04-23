import ProjectDescription

let project = Project(
    name: "RxSwiftDemo",
    settings: .settings(
        base: [
            "SWIFT_OPTIMIZATION_LEVEL": "O",
            "SWIFT_WHOLE_MODULE_OPTIMIZATION": "YES" // 이 설정이 핵심입니다
        ],
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ],
        defaultSettings: .recommended
    ),
    targets: [
        .target(
            name: "RxSwiftDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "kr.co.codegrove.RxSwiftDemo",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["RxSwiftDemo/Sources/**"],
            resources: ["RxSwiftDemo/Resources/**"],
            dependencies: [
                .external(name: "RxSwift"),
                .external(name: "RxCocoa"),
                .external(name: "RxRelay")
            ]
        ),
        .target(
            name: "RxSwiftDemoTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "kr.co.codegrove.RxSwiftDemoTests",
            infoPlist: .default,
            sources: ["RxSwiftDemo/Tests/**"],
            resources: [],
            dependencies: [.target(name: "RxSwiftDemo")]
        ),
    ]
)
