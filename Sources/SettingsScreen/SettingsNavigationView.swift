import SwiftUI
import UIKit

public struct SettingsNavigationView: View {

    @Environment(\.requestReview) private var requestReview
    @StateObject private var settingsNavigationState = SettingsNavigationState(applicationClient: UIApplicationClientImpl())

    private let settingsType: SettingsType

    public init(_ settingsType: SettingsType) {
        self.settingsType = settingsType
    }

    public var body: some View {
        switch settingsType {
        case let .assessment(imageType):
            SettingsNavigationButton(
                title: settingsType.title,
                imageType: imageType
            ) {
                requestReview()
            }
            .disclosureIndicatorIsHidden(true)
        case let .notification(imageType):
            SettingsNavigationButton(
                title: settingsType.title,
                imageType: imageType
            ) {
                settingsNavigationState.notification()
            }
        case let .custom(settingsType):
            SettingsNavigationButton(
                title: settingsType.title,
                imageType: settingsType.imageType,
                action: settingsType.action
            )
        case let .url(settingsType):
            SettingsLink(title: settingsType.title, url: settingsType.url, imageType: settingsType.imageType)
        case .colorTheme:
            SettingsNavigationLink(
                title: settingsType.title
            ) {
                ColorThemeView()
            }
        }
    }
}

