import SwiftUI

struct ContentView: View {
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    private let samples = [
        ImageItem(title: "Mountain", placeholderSymbol: "mountain.2.fill"),
        ImageItem(title: "Ocean", placeholderSymbol: "water.waves"),
        ImageItem(title: "Sunset", placeholderSymbol: "sunset.fill"),
        ImageItem(title: "Forest", placeholderSymbol: "leaf.fill"),
        ImageItem(title: "Clouds", placeholderSymbol: "cloud.fill"),
        ImageItem(title: "Night Sky", placeholderSymbol: "moon.stars.fill")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    introduction

                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(Array(samples.enumerated()), id: \.element.id) { index, sample in
                            ImageSampleCard(item: sample, tint: Self.tints[index % Self.tints.count])
                        }
                    }
                }
                .padding()
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Image Gallery")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var introduction: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Sample previews")
                .font(.largeTitle.bold())

            Text("A simple image gallery to try your model and download implementation.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 8)
    }

    private static let tints: [Color] = [
        .blue, .cyan, .orange, .green, .indigo, .purple
    ]
}

private struct ImageSampleCard: View {
    let item: ImageItem
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(tint.gradient)

                Image(systemName: item.placeholderSymbol)
                    .font(.system(size: 42, weight: .light))
                    .foregroundStyle(.white)
                    .accessibilityHidden(true)
            }
            .frame(height: 130)

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)

                Text("Preview placeholder")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background, in: RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ContentView()
}
