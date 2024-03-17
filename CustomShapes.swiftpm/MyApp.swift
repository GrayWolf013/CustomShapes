import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Creating custom Paths with SwiftUI")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.orange)
                    .multilineTextAlignment(.center)
                
                ScrollView {
                    VStack(spacing: 300) {
                        Triangle()
                        TriangleStroke()
                        TriangleStrokeClosed()
                        TriangleStrokeCloseSubpath()
                        TriangleStrokeRoundEdges()
                    //  needed as path height is not calucaled as ui element
                    // must use spacing or frame reader to calculate the frame
                        Spacer()
                    }
                }
            }
        }
    }
}
