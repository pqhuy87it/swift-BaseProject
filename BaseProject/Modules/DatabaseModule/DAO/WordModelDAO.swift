
import Foundation

class WordModelDAO: DAO {
    typealias T = RWordModel

    // MARK: - READ

    func queryAll() -> [WordModel]? {
        if let rSections = self.readDB() {
            return rSections.compactMap{ WordModel($0) }
        }

        return nil
    }
    
    // MARK: - SEARCH
    
    func searchBy(_ searchType: SearchType, searchText: String) -> [WordModel]? {
        var conditionStr = ""
        
        switch searchType {
        case .contain:
            conditionStr = "text CONTAINS[c] '\(searchText)' OR textFurigana CONTAINS[c] '\(searchText)' OR meaning CONTAINS[c] '\(searchText)'"
        case .exactly:
            conditionStr = "text %@ = \(searchText)"
        case .beginWith:
            conditionStr = "BEGINSWITH[d] '\(searchText)'"
        case .endWith:
            conditionStr = " ENDSWITH[d] '\(searchText)'"
        }
        
        let queryCondition = NSPredicate(format: conditionStr)
        
        if let rModels = self.readDBBy(queryCondition) {
            return rModels.compactMap { WordModel($0) }
        }
        
        return nil
    }
	
	func queryByFavourite() -> [WordModel]? {
		let queryCondition = NSPredicate(format: "isFavorite = true")

		if let rModels = self.readDBBy(queryCondition) {
			return rModels.compactMap { WordModel($0) }
		}

		return nil
	}

    // MARK: - CREATE

    func create(_ model: WordModel) {
        if let rModel = RWordModel.factoryMethod(model) {
            self.createDB(rModel)
        }
    }

    func create(_ models: [WordModel]) {
        let rModels = models.compactMap{ RWordModel.factoryMethod($0) }
        self.createDB(rModels)
    }

    // MARK: - UPDATE

    func update(_ model: WordModel) {
        if let rModel = RWordModel.factoryMethod(model) {
            self.updateDB(rModel)
        }
    }

    // MARK: - DELETE

    // MARK: - GET INCREMENT ID
}
