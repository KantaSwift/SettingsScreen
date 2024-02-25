import SwiftUI

public struct CustomSettings {
    let title: String
    let imageType: ImageType
    let action: () -> Void

    public init(
        title: String,
        imageType: ImageType = .none,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.imageType = imageType
        self.action = action
    }
}

