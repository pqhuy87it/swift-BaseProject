
import UIKit

public extension UIButton {
	var imageForDisabled: UIImage? {
		get {
			return image(for: .disabled)
		}
		set {
			setImage(newValue, for: .disabled)
		}
	}

	var imageForHighlighted: UIImage? {
		get {
			return image(for: .highlighted)
		}
		set {
			setImage(newValue, for: .highlighted)
		}
	}

	var imageForNormal: UIImage? {
		get {
			return image(for: .normal)
		}
		set {
			setImage(newValue, for: .normal)
		}
	}

	var imageForSelected: UIImage? {
		get {
			return image(for: .selected)
		}
		set {
			setImage(newValue, for: .selected)
		}
	}

	var titleColorForDisabled: UIColor? {
		get {
			return titleColor(for: .disabled)
		}
		set {
			setTitleColor(newValue, for: .disabled)
		}
	}

	var titleColorForHighlighted: UIColor? {
		get {
			return titleColor(for: .highlighted)
		}
		set {
			setTitleColor(newValue, for: .highlighted)
		}
	}

	var titleColorForNormal: UIColor? {
		get {
			return titleColor(for: .normal)
		}
		set {
			setTitleColor(newValue, for: .normal)
		}
	}

	var titleColorForSelected: UIColor? {
		get {
			return titleColor(for: .selected)
		}
		set {
			setTitleColor(newValue, for: .selected)
		}
	}

	var titleForDisabled: String? {
		get {
			return title(for: .disabled)
		}
		set {
			setTitle(newValue, for: .disabled)
		}
	}

	var titleForHighlighted: String? {
		get {
			return title(for: .highlighted)
		}
		set {
			setTitle(newValue, for: .highlighted)
		}
	}

	var titleForNormal: String? {
		get {
			return title(for: .normal)
		}
		set {
			setTitle(newValue, for: .normal)
		}
	}

	var titleForSelected: String? {
		get {
			return title(for: .selected)
		}
		set {
			setTitle(newValue, for: .selected)
		}
	}

	private var states: [UIControl.State] {
		return [.normal, .selected, .highlighted, .disabled]
	}

	/// SwifterSwift: Set image for all states.
	///
	/// - Parameter image: UIImage.
	func setImageForAllStates(_ image: UIImage) {
		states.forEach { setImage(image, for: $0) }
	}

	/// SwifterSwift: Set title color for all states.
	///
	/// - Parameter color: UIColor.
	func setTitleColorForAllStates(_ color: UIColor) {
		states.forEach { setTitleColor(color, for: $0) }
	}

	/// SwifterSwift: Set title for all states.
	///
	/// - Parameter title: title string.
	func setTitleForAllStates(_ title: String) {
		states.forEach { setTitle(title, for: $0) }
	}

	/// SwifterSwift: Center align title text and image.
	/// - Parameters:
	///   - imageAboveText: set true to make image above title text, default is false, image on left of text.
	///   - spacing: spacing between title text and image.
	func centerTextAndImage(imageAboveText: Bool = false, spacing: CGFloat) {
		if imageAboveText {
			// https://stackoverflow.com/questions/2451223/#7199529
			guard
				let imageSize = imageView?.image?.size,
				let text = titleLabel?.text,
				let font = titleLabel?.font else { return }

			let titleSize = text.size(withAttributes: [.font: font])

			let titleOffset = -(imageSize.height + spacing)
			titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: titleOffset, right: 0.0)

			let imageOffset = -(titleSize.height + spacing)
			imageEdgeInsets = UIEdgeInsets(top: imageOffset, left: 0.0, bottom: 0.0, right: -titleSize.width)

			let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
			contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
		} else {
			let insetAmount = spacing / 2
			imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
			titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
			contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
		}
	}
}
