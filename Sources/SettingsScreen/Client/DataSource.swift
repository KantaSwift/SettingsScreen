import SwiftUI
protocol DataSource {
    func data<T: Decodable>(
        forKey: String,
        type: T.Type
    ) -> T?

    func set(
        _ value: some Encodable,
        forKey: String
    ) async throws

    func set(_ value: Any?, forKey: String) async
}


