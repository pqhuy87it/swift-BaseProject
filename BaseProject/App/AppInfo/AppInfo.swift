import Foundation

struct AppInfo {
    static let version: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    static let build: String = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
    static let appName: String = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "ゆうちょ"
    static let appId = 9999
    static let appURLScheme: String = (((Bundle.main.infoDictionary?["CFBundleURLTypes"] as! NSArray)[0] as! NSDictionary).value(forKey: "CFBundleURLSchemes") as! NSArray)[0] as? String ?? "none"
}
