import SwiftUI

final class SettingsNavigationState: ObservableObject {
    private let applicationClient: UIApplicationClient

    init(applicationClient: UIApplicationClient) {
        self.applicationClient = applicationClient
    }

    func notification() {
        Task {
            if let url = await URL(string: applicationClient.getOpenSettingsURLString()) {
                await applicationClient.openUrl(url)
            }
        }
    }
}

