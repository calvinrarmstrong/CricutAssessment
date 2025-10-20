//
//  Triangle.swift
//  CricutAssessment
//
//  Created by Calvin Armstrong on 10/19/25.
//
//  Sources
//  https://developer.apple.com/tutorials/swiftui/drawing-paths-and-shapes

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path(){ path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
        }
    }
    
    
}
