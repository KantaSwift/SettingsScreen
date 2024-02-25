import Client
import SwiftUI

public final class SettingsNavigationState: ObservableObject {
    private let applicationClient: UIApplicationClient

    public init(applicationClient: UIApplicationClient) {
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

