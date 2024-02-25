import SwiftUI

protocol UIApplicationClient {
    func setUserInterfaceStyle(_ interface: UIUserInterfaceStyle) async -> Void
    func getOpenSettingsURLString() async -> String
    func openUrl(_ url: URL) async -> Void
}

struct UIApplicationClientImpl: UIApplicationClient {

    @MainActor
    func setUserInterfaceStyle(_ interface: UIUserInterfaceStyle) async {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.overrideUserInterfaceStyle = interface
    }

    func getOpenSettingsURLString() async -> String {
        await UIApplication.openNotificationSettingsURLString
    }

    @MainActor
    func openUrl(_ url: URL) async {
        await UIApplication.shared.open(url)
    }
}
