import SwiftUI

public struct URLSettings {
    public let title: String
    public let url: String
    public let imageType: ImageType

    public init(
        title: String,
        url: String,
        imageType: ImageType = .none
    ) {
        self.title = title
        self.imageType = imageType
        self.url = url
    }
}

