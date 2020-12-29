//
//  SettingRepository.swift
//  N3Vocabulary
//
//  Created by Huy Pham Quang on 2020/03/24.
//  Copyright © 2020 Huy Pham Quang. All rights reserved.
//

import Foundation

class SettingRepository {
    let dao = SettingModelDAO()
    
    // MARK: - READ

    func queryAll() -> [SettingModel]? {
        return dao.queryAll()
    }

    // MARK: - CREATE

    func create(_ model: SettingModel) {
        dao.create(model)
    }

    // MARK: - UPDATE
    
    func update(_ model: SettingModel) {
        dao.update(model)
    }

    // MARK: - DELETE
}
