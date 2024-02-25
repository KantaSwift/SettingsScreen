import SwiftUI

public struct SettingsSection<Content: View>: View {
    let title: String
    let content: Content

    public init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content()
    }

    public var body: some View {
        Section(title) {
            content
        }
    }
}

