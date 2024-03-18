//
//  CustomShapes.swift
//  CustomShapes
//
//  Created by BESBES Ahmed on 17/3/2024.
//

import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                TrianglePaths()
                    .tabItem {
                        Label("Triangle Paths", systemImage: "pencil.line")
                    }
                
                TriangleShapes()
                    .tabItem {
                        Label("Triangle Shapes", systemImage: "triangle.lefthalf.filled")
                    }
                
                ArcShape()
                    .tabItem {
                        Label("Arc Shapes", systemImage: "pencil.and.outline")
                    }
                
                CustomizableShape()
                    .tabItem {
                        Label("Customizable Shape", systemImage: "scribble.variable")
                    }
            }
        }
    }
}


struct CustomizableShape: View {

    
var body: some View {
    VStack(spacing: 50) {
        CustomShape(cornerRadius: 25)
            .fill(.orange)
            .frame(height: 170)

    }
    .padding(20)
    }
}

struct CustomShape: Shape {
    var cornerRadius: CGFloat // Add corner radius property
    
    func path(in rect: CGRect) -> Path {
        let arcRadius = 55.0
        
        let point1 = (rect.width / 2) - arcRadius - 20
        let point1Control1 = CGPoint(
            x: point1 + 25,
            y: arcRadius + 5)
        let point1Control2 = CGPoint(
            x: point1 + 25,
            y: 0)
        
        let point2 = (rect.width / 2) + arcRadius + 20
        let point2Control1 = CGPoint(
            x: point2 - 25,
            y: 0)
        let point2Control2 = CGPoint(
            x: point2 - 25,
            y: arcRadius - 5)
        
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + arcRadius))
        
        // Add corner radius to the starting point
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + arcRadius + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        path.addLine(to: CGPoint(x: point1, y: rect.minY + arcRadius))
        
        path.addCurve(
            to: CGPoint(x: rect.midX, y: rect.minY),
            control1: point1Control1,
            control2: point1Control2
        )
        
        path.addCurve(
            to: CGPoint(x: point2, y: rect.minY + arcRadius),
            control1: point2Control1,
            control2: point2Control2
        )
        
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + arcRadius))
        
        // Add corner radius to the ending point
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + arcRadius + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 360), clockwise: false)
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + arcRadius + cornerRadius))
        
        path.closeSubpath()
        return path
    }
}
