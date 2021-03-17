
import Foundation
import UIKit

class Notifications {
	private static let ChangeTextSize = Notification.Name("NotificationChangeTextSize")
	private static let ChangeDisplayFurigana = Notification.Name("NotificationChangeDisplayFurigana")
    private static let ChangeLanguage = Notification.Name("NotificationChangeLanguage")

	class func postChangeTextSize() {
		NotificationCenter.default.post(name: Notifications.ChangeTextSize,
										object: nil)
	}

	class func postChangeDisplayFurigana() {
		NotificationCenter.default.post(name: Notifications.ChangeDisplayFurigana,
										object: nil)
	}
    
    class func postChangeLanguage() {
        NotificationCenter.default.post(name: Notifications.ChangeLanguage,
                                        object: nil)
    }

	class func addObserverChangeTextSize(_ viewcontroller: UIViewController, selector: Selector) {
		 NotificationCenter.default.addObserver(viewcontroller,
												selector: selector,
												name: Notifications.ChangeTextSize,
												object: nil)
	}

	class func addObserverChangeDisplayFurigana(_ viewcontroller: UIViewController, selector: Selector) {
		NotificationCenter.default.addObserver(viewcontroller,
											   selector: selector,
											   name: Notifications.ChangeDisplayFurigana,
											   object: nil)
	}
    
    class func addObserverChangeLanguage(_ viewcontroller: UIViewController, selector: Selector) {
        NotificationCenter.default.addObserver(viewcontroller,
                                               selector: selector,
                                               name: Notifications.ChangeLanguage,
                                               object: nil)
    }

	class func removeObserver(_ viewcontroller: UIViewController) {
		NotificationCenter.default.removeObserver(viewcontroller)
	}
}
