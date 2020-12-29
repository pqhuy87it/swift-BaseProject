import RealmSwift
import Foundation
import UIKit

class RealmService {
    
    static let shared: RealmService = RealmService()
    
    private init() {
        logD("RealmService initialized", logLevel: .info)
    }
    
    func post(_ error:Error) {
        NotificationCenter.default.post(name: NSNotification.Name("RealmError"), object: error)
    }
    
    func obseerveRealmError(in vc:UIViewController,completion: @escaping (Error?)->Void) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("RealmError"), object: nil, queue: nil) { (notification) in
            completion(notification.object as? Error)
        }
    }
    
    func stopObseerveRealmError(in vc:UIViewController){
        NotificationCenter.default.removeObserver(vc, name: NSNotification.Name("RealmError"), object: nil)
    }
    
    static func getRealm() throws -> Realm? {
        let encryptionConfig = Realm.Configuration(encryptionKey: Data(base64Encoded: k.keyEncryptedRealm))
        // key
        /*
         AF235E394366BF44E630501EF83630BF141F2FEC0BD4620BC3F6EF0571B0FD8FF643CEB75CE47A05708F0C237CFE89949035CFD593FECECDA4ADC4D4007A81E2

         */
        return try Realm(configuration: encryptionConfig)
    }
    
    static func deleteAllDatabase() {
        do {
            guard let realm = try RealmService.getRealm() else {
                return
            }
            
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            // handle error
            logD(error, logLevel: .error)
        }
    }

    static func createCopyRealm() {
		guard let defaultRealmPath = Realm.Configuration.defaultConfiguration.fileURL else {
			logD("realm path is not exist!", logLevel: .warning)
			return
		}

        let bundleReamPath = Bundle.main.path(forResource: "default", ofType:"realm")
        
		do {
			try FileManager.default.copyItem(atPath: bundleReamPath!, toPath: defaultRealmPath.path)
		} catch let error as NSError {
			// Catch fires here, with an NSError being thrown
			logD("error occurred, here are the details:\n \(error)", logLevel: .emergency)
		}
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    static func removeDefaultRealm() {
		guard let defaultRealmPath = Realm.Configuration.defaultConfiguration.fileURL else {
			logD("realm path is not exist!", logLevel: .warning)
			return
		}
        
        if FileManager.default.fileExists(atPath: defaultRealmPath.path) {
            do {
                try FileManager.default.removeItem(at: defaultRealmPath)
            } catch let error as NSError {
                // Catch fires here, with an NSError being thrown
                print("error occurred, here are the details:\n \(error)")
                return
            }
        }
    }
}

// MARK: - Extension Realm

extension Results {
    func toArray<T>(type: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}
