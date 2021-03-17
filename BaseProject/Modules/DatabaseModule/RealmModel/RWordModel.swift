//

import Foundation
import RealmSwift

class RWordModel: Object {
	@objc dynamic var id: Int = 1
    @objc dynamic var text: String = ""

    
    override public static func primaryKey() -> String? {
        return "id"
    }

    convenience init?(_ wordObject: WordModel?) {
        self.init()
        parse(wordObject)
    }
    
    static func factoryMethod(_ model: WordModel?) -> RWordModel? {
        let this = RWordModel(model)
        return this
    }

    fileprivate func parse(_ model: WordModel?) {
        guard let model = model else { return }

		self.id = model.id
        self.text = model.text
    }
}
