//
//  TrianglePaths.swift
//  TrianglePaths
//
//  Created by BESBES Ahmed on 17/3/2024.
//

import SwiftUI

struct TrianglePaths: View {
    var body: some View {
        VStack {
            VStack {
                Text("Draw Triangle shapes with Path")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.orange)
                Text("Paths are absolut position and not dynamic, relying on pixel positions.")
            }
            .multilineTextAlignment(.center)
            .padding()
            
            ScrollView {
                VStack(spacing: 300) {
                    Triangle()
                    TriangleStroke()
                    TriangleStrokeClosed()
                    TriangleStrokeCloseSubpath()
                    TriangleStrokeRoundEdges()
                    //  needed as path height is not calucaled as ui element
                    // must use spacing or frame reader to calculate the frame
                    Spacer(minLength: 50)
                }
            }
        }
    }
}
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
// commented line not needed
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
