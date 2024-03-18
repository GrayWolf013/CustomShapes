//
//  TriangleShapes.swift
//  TriangleShapes
//
//  Created by BESBES Ahmed on 17/3/2024.
//

import SwiftUI

struct TriangleShapes: View {
    var body: some View {
        VStack {
            VStack {
                Text("Draw Triangle Shapes with Shapes")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.orange)
                Text("Unlike Paths Shapes are dynamic, and can be drawn inside a determined space.")
            }
            .multilineTextAlignment(.center)
            .padding()
            
            ScrollView {
                VStack(spacing: 50) {
                    TriangleShape()
                        .fill(.red)
                        .frame(height: 300)
                    
                    TriangleShapeStroke()
                        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .frame(height: 300)
                    
                    TriangleShapeStrokeClosed()
                        .stroke(.cyan, style: StrokeStyle(lineWidth: 10))
                        .frame(height: 300)
                    
                    TriangleSahpeStrokeCloseSubpath()
                        .stroke(.orange, style: StrokeStyle(lineWidth: 10))
                        .frame(height: 300)
                    
                    TriangleShapeStrokeClosedRoundEdges()
                        .stroke(.yellow, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .frame(height: 300)
                    
                }
                .padding(50)
            }
        }
    }
}

// Normal triangle (no need to close it)
// commented line not needed
struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

// Triangle with stroke (border)
// if you don't close it, it looks incomplete
// commented line needed
struct TriangleShapeStroke: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//      path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

// Triangle with stroke (border)
// if you don't closeSubpath it looks not sharp at the top
// commented line needed
struct TriangleShapeStrokeClosed: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.closeSubpath()
        return path
    }
}
// Triangle with stroke (border)
struct TriangleSahpeStrokeCloseSubpath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

// Triangle with stroke (border) and round edges
// commented line not needed
struct TriangleShapeStrokeClosedRoundEdges: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.closeSubpath()
        return path
    }
}

