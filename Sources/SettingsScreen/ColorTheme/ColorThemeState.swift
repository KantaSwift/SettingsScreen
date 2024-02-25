import SwiftUI

final class ColorThemeState: ObservableObject {
    @Published var colorThemeType: ColorThemeType = .auto
    private let colorThemeRepository: ColorThemeRepository

    init(colorThemeRepository: any ColorThemeRepository) {
        self.colorThemeRepository = ColorThemeRepositoryImpl(
            userDefaults: .standard,
            uiApplicationClient: UIApplicationClientImpl()
        )
    }

    func loadColorTheme() {
        Task { @MainActor in
            guard let colorThemeType = await colorThemeRepository.getColorTheme() else {
                return
            }
            self.colorThemeType = colorThemeType
        }
    }

    func setColorTheme(colorThemeType: ColorThemeType) {
        Task { @MainActor in
           self.colorThemeType = colorThemeType
           try await colorThemeRepository.setColorTheme(colorThemeType)
        }
    }
}

