
import Foundation

enum Language: String {
	case en
	case vn

	var title: String {
		switch self {
		case .en:
			return "English(US)"
		case .vn:
			return "Tiếng Việt"
		}
	}

	var description: String {
		switch self {
		case .en:
			return "English(US)"
		case .vn:
			return "Vietnamese"
		}
	}

	var localizeTableName: String {
		switch self {
		case .vn:
			return "Localizable_vi"
		case .en:
			return "Localizable_en"
		}
	}
}
