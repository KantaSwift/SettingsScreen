import SwiftUI

struct UserDefaultsClient: DataSource {
    let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func data<T: Decodable>(
        forKey: String,
        type: T.Type
    ) -> T? {
        if let data = userDefaults.object(forKey: forKey) as? Data {
            let decoder = JSONDecoder()
            do {
                return try decoder.decode(type, from: data)
            } catch {
                return nil
            }
        }
        return nil
    }

    func set(
        _ value: some Encodable,
        forKey: String
    ) async throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(value)
        userDefaults.set(data, forKey: forKey)
    }

    func set(_ value: Any?, forKey: String) async {
        userDefaults.set(value, forKey: forKey)
    }
}

