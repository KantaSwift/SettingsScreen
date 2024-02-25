import SwiftUI

struct DisclosureIndicatorIsHiddenKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var disclosureIndicatorIsHidden: Bool {
        get { self[DisclosureIndicatorIsHiddenKey.self] }
        set { self[DisclosureIndicatorIsHiddenKey.self] = newValue }
    }
}
