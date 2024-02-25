import SwiftUI
import Client
import SharedModel

public struct ColorThemeView: View {
    @StateObject private var colorThemeState = ColorThemeState(
        colorThemeRepository: ColorThemeRepositoryImpl(
            userDefaults: .standard,
            uiApplicationClient: UIApplicationClientImpl()
        )
    )

    public init() {}

    public var body: some View {
        Form {
            ForEach(ColorThemeType.allCases, id: \.self) { colorThemeType in
                HStack {
                    Text(colorThemeType.title)

                    Spacer()
                    if colorThemeType == self.colorThemeState.colorThemeType {
                        Image(systemName: "checkmark")
                            .font(.body)
                    }
                }
                .onTapGesture {
                    colorThemeState.setColorTheme(colorThemeType: colorThemeType)
                }
            }
        }
        .navigationTitle("カラーテーマ")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            colorThemeState.loadColorTheme()
        }
    }
}

