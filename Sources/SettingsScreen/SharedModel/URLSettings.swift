import SwiftUI

public struct URLSettings {
    let title: String
    let url: String
    let imageType: ImageType

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

