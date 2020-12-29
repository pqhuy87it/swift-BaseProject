import UIKit

enum BarButtonItemPosition {
	case right
	case left
}

class CustomBarButtonItem: UIBarButtonItem {
	// MARK: - Initializers

	/*
	init(position: BarButtonItemPosition) {
		let button = AlignmentButton(frame: CGRect(x:0, y: 0, width: 24, height: 24))
		// spacerが入っている分8pt外側にずらす
		switch position {
		case .left:
			button.alignmentRectInsetsOverride = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
		case .right:
			button.alignmentRectInsetsOverride = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
		}
		button.translatesAutoresizingMaskIntoConstraints = false

		super.init()
		self.customView = button
	}
	*/

	convenience init(position: BarButtonItemPosition, imageEdgeInsets: UIEdgeInsets = .zero, image: UIImage?) {
		let button = AlignmentButton(frame: CGRect(x:0, y: 0, width: 24, height: 24))
		// spacerが入っている分8pt外側にずらす
		switch position {
		case .left:
			button.alignmentRectInsetsOverride = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
		case .right:
			button.alignmentRectInsetsOverride = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
		}

		button.translatesAutoresizingMaskIntoConstraints = false
		button.adjustsImageWhenHighlighted = true
		button.imageEdgeInsets = imageEdgeInsets
		button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
		button.setImage(image, for: .normal)

		self.init(customView: button)
	}
}
