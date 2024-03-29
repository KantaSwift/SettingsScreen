import SwiftUI

extension View {
    func disclosureIndicatorIsHidden(_ isHidden: Bool = false) -> some View {
        environment(\.disclosureIndicatorIsHidden, isHidden)
    }
}

