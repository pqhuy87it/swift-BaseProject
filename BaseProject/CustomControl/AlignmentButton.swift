
import UIKit

class AlignmentButton: UIButton {

	var alignmentRectInsetsOverride: UIEdgeInsets?

	override var alignmentRectInsets: UIEdgeInsets {
		return alignmentRectInsetsOverride ?? super.alignmentRectInsets
	}

}
