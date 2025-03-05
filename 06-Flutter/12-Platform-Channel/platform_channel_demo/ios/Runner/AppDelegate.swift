import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // 안전한 옵셔널 언래핑
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let batteryChannel = FlutterMethodChannel(name: "kr.co.codegrove.platform_channel_demo/battery", binaryMessenger: controller.binaryMessenger)
        
        batteryChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            guard self != nil else { return }
            if call.method == "getBatteryLevel" {
                let device = UIDevice.current
                device.isBatteryMonitoringEnabled = true  // 🔥 이 부분이 필요함
                if device.batteryState == UIDevice.BatteryState.unknown {
#if targetEnvironment(simulator)
                    result(66) // 시뮬레이터에서는 임의의 배터리 값을 반환
#else
                    result(FlutterError(code: "UNAVAILABLE",
                                        message: "Battery info unavailable",
                                        details: nil))
#endif
                } else {
                    result(Int(device.batteryLevel * 100))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
