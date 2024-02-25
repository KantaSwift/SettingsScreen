import SwiftUI

public struct SettingsNavigationList<Content: View>: View {
    let content: Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    public var body: some View {
        NavigationStack {
            List {
                content
            }
        }
    }
}

