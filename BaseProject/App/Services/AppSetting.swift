import Foundation
import UIKit

class AppSetting {
    static let shared: AppSetting = {
        let instance = AppSetting()
        return instance
    }()
    
    var language: Language = .vn
	var isFurigana = true
	var fontSize = 20
	var furiganaSize: Float = 0.5
    var fontName: String = ""
    var font: UIFont = .systemFont(ofSize: 18)
}
