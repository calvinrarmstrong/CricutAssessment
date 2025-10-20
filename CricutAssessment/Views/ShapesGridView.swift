//
//  ShapesGridView.swift
//  CricutAssessment
//
//  Created by Calvin Armstrong on 10/19/25.
//

import SwiftUI

struct ShapesGridView: View {
    @Binding var shapes: [ShapeGridItem]
    var includedShapes: [ShapeType]?
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]) {
                ForEach(shapes){ shape in
                    if includedShapes == nil || includedShapes!.contains(shape.shapeType) {
                        switch shape.shapeType {
                        case .circle:
                            Circle()
                                .frame(width: shape.shapeSize, height: shape.shapeSize)
                        case .square:
                            Rectangle()
                                .frame(width: shape.shapeSize, height: shape.shapeSize)
                        case .triangle:
                            Triangle()
                                .frame(width: shape.shapeSize, height: shape.shapeSize)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let testShapes = [
        ShapeGridItem(shapeType: .square),
        ShapeGridItem(shapeType: .triangle),
        ShapeGridItem(shapeType: .square),
        ShapeGridItem(shapeType: .circle),
        ShapeGridItem(shapeType: .triangle),
        ShapeGridItem(shapeType: .square),
        ShapeGridItem(shapeType: .circle),
        ShapeGridItem(shapeType: .circle),
        ShapeGridItem(shapeType: .triangle),
        ShapeGridItem(shapeType: .square),
        ShapeGridItem(shapeType: .circle),
        ShapeGridItem(shapeType: .triangle),
    ]
    ShapesGridView(shapes: .constant(testShapes))
}
