import SwiftUI

public protocol UIApplicationClient {
    func setUserInterfaceStyle(_ interface: UIUserInterfaceStyle) async -> Void
    func getOpenSettingsURLString() async -> String
    func openUrl(_ url: URL) async -> Void
}

public struct UIApplicationClientImpl: UIApplicationClient {

    public init() {}

    @MainActor
    public func setUserInterfaceStyle(_ interface: UIUserInterfaceStyle) async {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.overrideUserInterfaceStyle = interface
    }

    public func getOpenSettingsURLString() async -> String {
        await UIApplication.openNotificationSettingsURLString
    }

    @MainActor
    public func openUrl(_ url: URL) async {
        await UIApplication.shared.open(url)
    }
}
