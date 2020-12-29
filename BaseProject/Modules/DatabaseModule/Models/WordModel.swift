import Foundation
import UIKit

class WordModel: Codable, BaseModelProtocol {
	var id = 1
	var text = ""

    convenience init?(_ model: RWordModel?) {
        self.init()
        self.parseFromRealm(model)
    }

    private func parseFromRealm(_ model: RWordModel?) {
        guard  let model = model else {
            return
        }

		self.id = model.id
        self.text = model.text
    }
}

extension WordModel: Equatable {
	static func == (lhs: WordModel, rhs: WordModel) -> Bool {
		return lhs.id == rhs.id
	}
}

