//
//  RSettingModel.swift
//  N3Vocabulary
//
//  Created by Huy Pham Quang on 2020/03/24.
//  Copyright © 2020 Huy Pham Quang. All rights reserved.
//

import Foundation
import RealmSwift

class RSettingModel: Object {
	@objc dynamic var id: String = ""
    @objc dynamic var language: String = ""
	@objc dynamic var fontSize: Int = 18
	@objc dynamic var furiganaSize: Float = 0.5
    @objc dynamic var fontName: String = ""
    
    convenience init?(_ model: SettingModel?) {
        self.init()
        parse(model)
    }
    
    override public static func primaryKey()->String? {
        return "id"
    }

    static func factoryMethod(_ model: SettingModel?) -> RSettingModel? {
        let rModel = RSettingModel(model)
        return rModel
    }

    fileprivate func parse(_ model: SettingModel?) {
        guard let model = model else { return }
        
        self.id = model.id
        self.language = model.language.rawValue
		self.fontSize = model.fontSize
		self.furiganaSize = model.furiganaSize
        self.fontName = model.fontName
    }
}
