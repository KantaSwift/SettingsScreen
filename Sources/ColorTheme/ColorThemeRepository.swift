import SwiftUI
import Client
import SharedModel

public protocol ColorThemeRepository {
    func setColorTheme(_ type: ColorThemeType) async throws -> Void
    func getColorTheme() async -> ColorThemeType?
}

public struct ColorThemeRepositoryImpl: ColorThemeRepository {
    enum Const {
        static let colorThemeKey: String = "colorTheme"
    }
    let userDefaults: any DataSource
    let uiApplicationClient: UIApplicationClient

    package init(userDefaults: UserDefaults, uiApplicationClient: UIApplicationClient) {
        self.userDefaults = UserDefaultsClient(userDefaults: userDefaults)
        self.uiApplicationClient = uiApplicationClient
    }

    @MainActor
    public func setColorTheme(_ type: ColorThemeType) async throws {
        await uiApplicationClient.setUserInterfaceStyle(type.userInterfaceStyle)
        try await userDefaults.set(type, forKey: Const.colorThemeKey)
    }

    public func getColorTheme() async -> ColorThemeType? {
        userDefaults.data(forKey: Const.colorThemeKey, type: ColorThemeType.self)
    }
}

