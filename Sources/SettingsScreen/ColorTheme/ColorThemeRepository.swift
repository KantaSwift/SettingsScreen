import SwiftUI

protocol ColorThemeRepository {
    func setColorTheme(_ type: ColorThemeType) async throws -> Void
    func getColorTheme() async -> ColorThemeType?
}

struct ColorThemeRepositoryImpl: ColorThemeRepository {
    private enum Const {
        static let colorThemeKey: String = "colorTheme"
    }
    private let userDefaults: any DataSource
    private let uiApplicationClient: UIApplicationClient

    init(userDefaults: UserDefaults, uiApplicationClient: UIApplicationClient) {
        self.userDefaults = UserDefaultsClient(userDefaults: userDefaults)
        self.uiApplicationClient = uiApplicationClient
    }

    @MainActor
    func setColorTheme(_ type: ColorThemeType) async throws {
        await uiApplicationClient.setUserInterfaceStyle(type.userInterfaceStyle)
        try await userDefaults.set(type, forKey: Const.colorThemeKey)
    }

    func getColorTheme() async -> ColorThemeType? {
        userDefaults.data(forKey: Const.colorThemeKey, type: ColorThemeType.self)
    }
}

