import SwiftUI

public enum ImageType {
    case original(_ named: String)
    case system(systemName: String)
    case none

    @ViewBuilder
    public var image: some View {
        switch self {
        case let .original(name):
            Image(name).resizable()
        case let .system(systemName):
            Image(systemName: systemName).resizable()
        case .none:
            EmptyView().frame(width: 0, height: 0)
        }
    }
}

