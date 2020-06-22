/**
* ColorSchemePreviews
* Copyright © 2020 Lucas Brown
*/

import SwiftUI

public extension View {
	/// Generates previews for light and dark color schemes.
	func colorSchemePreviews(previewLayout: PreviewLayout = .device) -> some View {
		/// A workaround for `PreviewLayout`'s lack of `Equatable` conformance.
		let previewLayoutIsSizeThatFits: Bool
		
		switch previewLayout {
			case .sizeThatFits:
				previewLayoutIsSizeThatFits = true
			default:
				previewLayoutIsSizeThatFits = false
		}
		
		return
			ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
				Group {
					if previewLayoutIsSizeThatFits {
						self
							// Add a system-background-color view for the dark-color scheme.
							.background(
								Color(.systemBackground)
						)
							.environment(\.colorScheme, colorScheme)
							.previewDisplayName(self.previewDisplayName(from: colorScheme))
					} else {
						// Use `ZStack` to create a resizable-background view.
						ZStack {
							Color(.systemBackground)
							self
						}
						.environment(\.colorScheme, colorScheme)
						.previewDisplayName(self.previewDisplayName(from: colorScheme))
					}
				}
			}
			.previewLayout(previewLayout)
	}
}

private extension View {
	func previewDisplayName(from colorScheme: ColorScheme) -> String {
		colorScheme == .light ? "Light Color Scheme" : "Dark Color Scheme"
	}
}
