import Foundation

struct ImageItem: Identifiable {
    let id: UUID
    let title: String
    let imageURL: URL?
    let placeholderSymbol: String

    init(
        id: UUID = UUID(),
        title: String,
        imageURL: URL? = nil,
        placeholderSymbol: String
    ) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.placeholderSymbol = placeholderSymbol
    }
}
