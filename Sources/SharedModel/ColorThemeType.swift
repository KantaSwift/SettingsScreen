import Foundation
import UIKit

public enum ColorThemeType: CaseIterable, Codable, Hashable {
    case light, dark, auto

    public var title: String {
        switch self {
        case .light:
            "ライトモード"
        case .dark:
            "ダークモード"
        case .auto:
            "自動"
        }
    }

    public var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light:
            .light
        case .dark:
            .dark
        case .auto:
            .unspecified
        }
    }
}

public extension UIUserInterfaceStyle {
    var colorThemeStyle: ColorThemeType {
        switch self {
        case .unspecified:
            return .auto
        case .light:
            return .light
        case .dark:
            return .dark
        @unknown default:
            return .auto
        }
    }
}

