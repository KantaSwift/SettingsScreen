import SwiftUI

public struct DisclosureIndicatorIsHiddenKey: EnvironmentKey {
    public static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    var disclosureIndicatorIsHidden: Bool {
        get { self[DisclosureIndicatorIsHiddenKey.self] }
        set { self[DisclosureIndicatorIsHiddenKey.self] = newValue }
    }
}
