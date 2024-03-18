//
//  ArcShape.swift
//  CustomShapes
//
//  Created by BESBES Ahmed on 17/3/2024.
//

import SwiftUI

struct ArcShape: View {
    var body: some View {
        VStack {
            VStack {
                Text("Draw an Arc with Shape")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.orange)
                Text("0 angle is on the right not up, and swift draw the bottom left corner")
            }
            .multilineTextAlignment(.center)
            .padding()
            
            ScrollView {
                VStack(spacing: 50) {
                    Arc(startAngle: .degrees(0), endAngle: .degrees(110), clickWise: true)
                        .stroke(.red, style: StrokeStyle(lineWidth: 10))
                        .frame(height: 300)
                    
                    ArcAdjusted(startAngle: .degrees(0), endAngle: .degrees(110), clickWise: true)
                        .stroke(.blue, style: StrokeStyle(lineWidth: 10))
                        .frame(height: 300)
                }
                .padding(40)
            }
        }
    }
}


struct Arc: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let clickWise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: (rect.width / 2),
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clickWise)
        return path
    }
}

struct ArcAdjusted: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let clickWise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStartAngle = startAngle - rotationAdjustment
        let modifiedEndAngle = endAngle - rotationAdjustment
        let modifiedClickWise = !clickWise

        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: (rect.width / 2),
            startAngle: modifiedStartAngle,
            endAngle: modifiedEndAngle,
            clockwise: modifiedClickWise)
        return path
    }
}


//struct CustomShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        let arcRadius = 55.0
//        let pointElevation = 8.0
//
//        let point1 = (rect.width / 2) - arcRadius - 20
//        let point2 = (rect.width / 2) + arcRadius + 20
//
//        var path = Path()
//        path.move(to: CGPoint(x: rect.minX, y: rect.minY + arcRadius))
//        path.addLine(to: CGPoint(x: point1, y: rect.minY + arcRadius))
//
////        path.addQuadCurve(
////            to: CGPoint(x: point1, y: rect.minY + arcRadius - pointElevation),
////            control: CGPoint(x: point1 - 10, y: rect.minY + arcRadius - pointElevation + 20))
//        
//        
//        
//        path.addCurve(
//            to: CGPoint(x: rect.midX, y: rect.minY),
//            control1: CGPoint(x: point1 + 20, y: rect.minY + arcRadius - 20),
//            control2: CGPoint(x: rect.midX - 40, y: rect.minY - 20))
//        
//        
//        
//        
////        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: point2, y: rect.minY + arcRadius - pointElevation))
//        
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + arcRadius))
//        
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + arcRadius))
//
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.closeSubpath()
//        return path
//    }
//}


//struct CustomShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        let arcRadius = 55.0
//        let pointElevation = 8.0
//        
//        let point1 = (rect.width / 2) - arcRadius
//        let point2 = (rect.width / 2) + arcRadius
//        
//        var path = Path()
//        path.move(to: CGPoint(x: rect.minX, y: rect.minY + arcRadius))
//        path.addLine(to: CGPoint(x: point1, y: rect.minY + arcRadius - pointElevation))
//        
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: point2, y: rect.minY + arcRadius - pointElevation))
//        
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + arcRadius))
//        
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + arcRadius))
//        
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.closeSubpath()
//        return path
//    }
//}
