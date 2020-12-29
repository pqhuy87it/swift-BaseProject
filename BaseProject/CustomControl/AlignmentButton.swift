//
//  AlignmentButton.swift
//  N3Vocabulary
//
//  Created by mybkhn on 2020/05/27.
//  Copyright © 2020 Huy Pham Quang. All rights reserved.
//

import UIKit

class AlignmentButton: UIButton {

	var alignmentRectInsetsOverride: UIEdgeInsets?

	override var alignmentRectInsets: UIEdgeInsets {
		return alignmentRectInsetsOverride ?? super.alignmentRectInsets
	}

}
