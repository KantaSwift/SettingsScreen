import SwiftUI

struct SettingsLink: View {

    @Environment(\.disclosureIndicatorIsHidden) private var isHidden

    let title: String
    let url: String
    let imageType: ImageType

    init(title: String, url: String, imageType: ImageType = .none) {
        self.title = title
        self.url = url
        self.imageType = imageType
    }

    var body: some View {
        Link(destination: URL(string: url) ?? URL(fileURLWithPath: "")) {
            HStack {
                imageType.image
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(title)
                Spacer()
            }
            .foregroundStyle(.foreground)
        }
        .overlay(alignment: .trailing) {
            if !isHidden {
                NavigationLink.empty
                    .disabled(true)
            }
        }
    }
}

