import SwiftUI

struct SettingsNavigationButton: View {
    @Environment(\.disclosureIndicatorIsHidden) var isHidden

    let title: String
    let imageType: ImageType
    let action: () -> Void

    init(
        title: String,
        imageType: ImageType = .none,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.imageType = imageType
        self.action = action
    }

    var body: some View {
        Button {
            action()
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
        .overlay(alignment: .trailing) {
            if !isHidden {
                NavigationLink.empty
                    .disabled(true)
            }
        }
    }
}

