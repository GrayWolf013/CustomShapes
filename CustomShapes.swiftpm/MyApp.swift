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
            }
        }
    }
}
