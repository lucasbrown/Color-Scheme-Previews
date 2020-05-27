/**
* ColorSchemePreviews
* Copyright © 2020 Lucas Brown
*/

import SwiftUI

public struct ColorSchemePreviews_Demonstration: View {
	public init() {}
	
	public var body: some View {
		let text =
			Text("Hello, world.")
				.font(.largeTitle)
		
		return
			Group {
				text
					.colorSchemePreviews(previewLayout: .sizeThatFits)
				
				text
					.colorSchemePreviews(previewLayout: .fixed(width: 256, height: 256))
				
				text
					.colorSchemePreviews(previewLayout: .device)
					.edgesIgnoringSafeArea(.all)
		}
	}
}
