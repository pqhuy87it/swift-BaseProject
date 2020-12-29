//
//  WordRepository.swift
//  N3Vocabulary
//
//  Created by mybkhn on 2020/03/16.
//  Copyright © 2020 Huy Pham Quang. All rights reserved.
//

import Foundation

class WordRepository {
	let dao = WordModelDAO()

	// MARK: - READ

	func queryAll() -> [WordModel]? {
		return dao.queryAll()
	}
    
    // MARK: - SEARCH
    
    func searchBy(_ searchType: SearchType, searchText: String) -> [WordModel]? {
        return dao.searchBy(searchType, searchText: searchText)
    }

	func queryByFavourite() -> [WordModel]? {
		return dao.queryByFavourite()
	}

	// MARK: - CREATE

	func create(_ vocabulary: WordModel) {
		dao.create(vocabulary)
	}

	func create(_ vocabularies: [WordModel]) {
		dao.create(vocabularies)
	}

	// MARK: - UPDATE

	func update(_ word: WordModel) {
		dao.update(word)
	}

	// MARK: - DELETE
}
