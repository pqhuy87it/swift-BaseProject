import Foundation

public typealias JSONDictionary = [String: Any]
//public typealias ResponseHandler = (ResponseObject) -> Void

enum k {
    struct ParamKey {
        static let clientId                 = "client_id"
        static let clientSecret             = "client_secret"
        static let grantType                = "grant_type"
        static let refreshToken             = "refresh_token"
        static let accessToken              = "access_token"
    }
    
    // Realm config key
    public static let realmConfigKey = "realmConfigKey"
    public static let keyEncryptedRealm = "ryNeOUNmv0TmMFAe+DYwvxQfL+wL1GILw/bvBXGw/Y/2Q863XOR6BXCPDCN8/omUkDXP1ZP+zs2krcTUAHqB4g=="

    // AES key config
    public static let aesKey = "AESKey"
    public static let keyForRealm = "N3Vocalbulary app hoc tieng nhat"
}

