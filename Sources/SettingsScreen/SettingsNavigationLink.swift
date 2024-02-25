import SwiftUI
import StoreKit
import SharedModel

public struct SettingsNavigationLink<Destination: View>: View {

    @Environment(\.requestReview) private var requestReview

    let title: String
    let imageType: ImageType
    let destination: Destination

    init(
        title: String,
        imageType: ImageType = .none,
        destination: @escaping () -> Destination
    ) {
        self.title = title
        self.imageType = imageType
        self.destination = destination()
    }

    public var body: some View {
         NavigationLink {
            destination
         } label: {
             HStack {
                 imageType.image
                     .scaledToFit()
                     .frame(width: 20, height: 20)
                 Text(title)
                 Spacer()
             }
             .foregroundStyle(.foreground)
         }
         .foregroundStyle(.gray)
    }
}

