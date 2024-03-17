import SwiftUI

// Normal triangle (no need to close it)
// commented line not needed
struct Triangle: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
//          path.addLine(to: CGPoint(x: 200, y: 100))
        }
        .fill(.red)
    }
}

// Triangle with stroke (border)
// if you don't close it, it looks incomplete
// commented line needed
struct TriangleStroke: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
//          path.addLine(to: CGPoint(x: 200, y: 100))
//          path.closeSubpath()
        }
        .stroke(.blue, lineWidth: 10)
    }
}

// Triangle with stroke (border)
// if you don't closeSubpath it looks not sharp at the top
// commented line needed
struct TriangleStrokeClosed: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//          path.closeSubpath()
        }
        .stroke(.cyan, lineWidth: 10)
    }
}

// Triangle with stroke (border)
struct TriangleStrokeCloseSubpath: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.closeSubpath()
        }
        .stroke(.orange, lineWidth: 10)
    }
}

// Triangle with stroke (border) and round edges
// commented line not needed
struct TriangleStrokeRoundEdges: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
        }
        .stroke(.yellow, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}
