
import Foundation

class SettingModelDAO: DAO {
    typealias T = RSettingModel

    // MARK: - READ

    func queryAll() -> [SettingModel]? {
        if let rModels = self.readDB() {
            return rModels.compactMap{ SettingModel($0) }
        }

        return nil
    }
    
    // MARK: - SEARCH

    // MARK: - CREATE

    func create(_ model: SettingModel) {
        if let rModel = RSettingModel.factoryMethod(model) {
            self.createDB(rModel)
        }
    }

    // MARK: - UPDATE

    func update(_ model: SettingModel) {
        if let rModel = RSettingModel.factoryMethod(model) {
            self.updateDB(rModel)
        }
    }

    // MARK: - DELETE

    // MARK: - GET INCREMENT ID
}
