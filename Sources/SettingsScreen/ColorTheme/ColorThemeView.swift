import SwiftUI

struct ColorThemeView: View {
    @StateObject private var colorThemeState = ColorThemeState(
        colorThemeRepository: ColorThemeRepositoryImpl(
            userDefaults: .standard,
            uiApplicationClient: UIApplicationClientImpl()
        )
    )

    var body: some View {
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
                .contentShape(Rectangle())
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

