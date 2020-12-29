import Foundation
import UIKit

enum Color {
    case greenGradationTop
    case greenGradationBottom
    case incomeNormal
    case expenseNormal
    case primary
    case accent_primary
    case Secondary01
    case Secondary02
    case Secondary03
    case Secondary04
    case Secondary05
    case Secondary06
    case Secondary07
    case menuInfo
    case menu_koza_1
    case menu_koza_2
    case grayDisable
    case gray20
    case validateError
    case pincodeNormal
    case pincodeHightlight
    case preset
    case textFieldPlaceHolder
    case collectionTitle
    case monthEnable
    case monthDisable
    case monthSelect
    case monthTouchInSide
    case selectAccount
    case rememberColor
    case forgotColor
    case backgroundTestButton
	case answerCorrect
	case answerWrong
    case backgroundShapeColor
    case progressShapeColor
    
    func withAlpha(_ alpha: CGFloat) -> UIColor {
        return self.value.withAlphaComponent(alpha)
    }
}

extension Color {
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .greenGradationTop:
            instanceColor = UIColor(hex: "#009900")
        case .greenGradationBottom:
            instanceColor = UIColor(hex: "#9DC816")
        case .incomeNormal:
            instanceColor = UIColor(r: 168, g: 208, b: 240)
        case .expenseNormal:
            instanceColor = UIColor(r: 240, g: 168, b: 176)
        case .primary:
            instanceColor = UIColor(hex: "#009900")
        case .accent_primary:
            instanceColor = UIColor(hex: "#009900").withAlphaComponent(0.5)
        case .Secondary01:
            instanceColor = UIColor(hex: "#F2FAF2")
        case .Secondary02:
            instanceColor = UIColor(hex: "#F3F4F3")
        case .Secondary03:
            instanceColor = UIColor(hex: "#E5F4E5")
        case .Secondary04:
            instanceColor = UIColor(hex: "#CCEBCC")
        case .Secondary05:
            instanceColor = UIColor(hex: "#99D699")
        case .Secondary06:
            instanceColor = UIColor(hex: "#66C266")
        case .Secondary07:
            instanceColor = UIColor(hex: "#33AD33")
        case .menuInfo:
            instanceColor = UIColor(hex: "#D6EA79")
        case .menu_koza_1:
            instanceColor = UIColor(hex: "#EDAE93")
        case .menu_koza_2:
            instanceColor = UIColor(hex: "#EDCC93")
        case .grayDisable:
            instanceColor = UIColor(hex: "#EBEBEB")
        case .gray20:
            instanceColor = UIColor(hex: "#EFEFEF")
        case .validateError:
            instanceColor = UIColor(hex: "#F04830")
        case .pincodeNormal:
            instanceColor = UIColor(hex: "#F3FAF3")
        case .pincodeHightlight:
            instanceColor = UIColor(hex: "#DFEFDF")
        case .preset:
            instanceColor = UIColor(hex: "#A9A9A9")
        case .textFieldPlaceHolder:
            instanceColor = UIColor(hex: "#CCCCCC")
        case .collectionTitle:
            instanceColor = UIColor(hex: "#333333")
        case .monthEnable:
            instanceColor = UIColor(hex: "#F3F4F3")
        case .monthDisable:
            instanceColor = UIColor(hex: "#EBEBEB")
        case .monthSelect:
            instanceColor = UIColor(hex: "#CCEBCC")
        case .monthTouchInSide:
            instanceColor = UIColor(hex: "#009900").withAlphaComponent(0.05)
        case .selectAccount:
            instanceColor = UIColor(hex: "F7FCF7")
        case .rememberColor:
            instanceColor = UIColor(r: 35, g: 178, b: 109)
        case .forgotColor:
            instanceColor = UIColor(r: 254, g: 204, b: 31)
        case .backgroundTestButton:
            instanceColor = UIColor(hex: "#3FDAE5")
		case .answerCorrect:
			instanceColor = UIColor(r: 45, g: 176, b: 111)
		case .answerWrong:
			instanceColor = UIColor(r: 252, g: 115, b: 95)
        case .backgroundShapeColor:
            instanceColor = UIColor(r: 207, g: 212, b: 236)
        case .progressShapeColor:
            instanceColor = UIColor(r: 66, g: 87, b: 178)
        }
        
        return instanceColor
    }
}
