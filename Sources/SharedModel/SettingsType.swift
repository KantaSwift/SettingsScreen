import SwiftUI

public enum SettingsType {
    case assessment(ImageType = .none)
    case notification(ImageType = .none)
    case url(URLSettings)
    case custom(CustomSettings)
    case colorTheme(ImageType = .none)

    public var title: String {
        switch self {
        case .assessment:
            "評価"
        case let .custom(setting):
            setting.title
        case .notification:
            "通知"
        case let .url(settings):
            settings.title
        case .colorTheme:
            "カラーテーマ"
        }
    }
}

