import SwiftUI

public struct CustomSettings {
   public let title: String
   public let imageType: ImageType
   public let action: () -> Void

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

