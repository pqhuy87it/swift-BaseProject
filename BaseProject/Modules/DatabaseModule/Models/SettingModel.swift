import Foundation


class SettingModel: NSObject {
    var id: String = ""
    var language: Language = .vn
	var fontSize = 18
	var furiganaSize: Float = 0.5
    var fontName: String = ""
    
    convenience init?(_ model: RSettingModel?) {
        self.init()
        self.parseFromRealm(model)
    }

    private func parseFromRealm(_ model: RSettingModel?) {
        guard  let model = model else {
            return
        }

		self.id = model.id
        self.language = Language(rawValue: model.language) ?? .vn
		self.fontSize = model.fontSize
        self.fontName = model.fontName
    }
}
