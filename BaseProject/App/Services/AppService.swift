import Foundation
import UIKit
//import Firebase

class AppService: NSObject {
    class func bootstrap(with application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        application.beginReceivingRemoteControlEvents()
        
        // Exclusive button touch processing
        UIButton.appearance().isExclusiveTouch = true

		AppService.setupNaviationBar()
		AppService.createRealm()

//        FirebaseApp.configure()
    }

	class func setupNaviationBar() {
		// setup navBar.....
		UINavigationBar.appearance().barTintColor = Color.primary.value
		UINavigationBar.appearance().tintColor = .white
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		UINavigationBar.appearance().isTranslucent = false
	}

	class func createRealm() {
		let settingReposity = SettingRepository()

		if UserDefault.isFirstLaunch || (UserDefault.version < (Float(AppInfo.version) ?? 0.0)) {
			// copy database
			RealmService.removeDefaultRealm()

			// copy realm from resource
			RealmService.createCopyRealm()

			let settingModel = SettingModel()

			settingModel.id = UUID().uuidString
			settingModel.language = .vn
			settingModel.fontSize = Devices.isPhone() ? 18 : 24
			settingModel.fontName = FontDisplay.mPLUS1pLight.rawValue
			settingReposity.create(settingModel)

			AppSetting.shared.language = settingModel.language
			AppSetting.shared.isFurigana = true
			AppSetting.shared.fontSize = settingModel.fontSize
			AppSetting.shared.fontName = settingModel.fontName
			AppSetting.shared.font = FontDisplay.mPLUS1pLight.getFont()
		} else {
			// load setting
			if let settingModel = settingReposity.queryAll()?.first {
				AppSetting.shared.language = settingModel.language
				AppSetting.shared.fontSize = settingModel.fontSize
				AppSetting.shared.fontName = settingModel.fontName
				AppSetting.shared.furiganaSize = settingModel.furiganaSize

				if let font = FontDisplay(rawValue: settingModel.fontName)?.getFont() {
					AppSetting.shared.font = font
				}
			}
		}

		// save current version
		UserDefault.version = Float(AppInfo.version) ?? 0.0
	}
    
    class func bootstrap(with application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:], window: UIWindow?) -> Bool {
        
        return true
    }
}
