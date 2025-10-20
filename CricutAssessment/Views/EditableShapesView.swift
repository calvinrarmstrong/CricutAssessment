//
//  EditableShapesView.swift
//  CricutAssessment
//
//  Created by Calvin Armstrong on 10/19/25.
//
//  Sources
//  https://stackoverflow.com/questions/78414946/how-to-extend-content-view-beneath-the-navigation-bar-in-swiftui
//  https://developer.apple.com/documentation/swift/array/filter(_:)
//  https://www.reddit.com/r/SwiftUI/comments/17aruvw/preview_with_binding_properties/

import SwiftUI

struct EditableShapesView: View {
    var editableShapeType: ShapeType
    @Binding var shapes: [ShapeGridItem]
    
    var body: some View {
        VStack{
            // Scrollable grid view for shapes
            ShapesGridView(shapes: $shapes, includedShapes: [editableShapeType])
            
            // Footer
            HStack {
                
                // Display each button with spaces between
                Spacer()
                
                Button("Delete All") {
                    shapes = shapes.filter { $0.shapeType != editableShapeType }
                }
                Spacer()
                Button("Add") {
                    shapes.append(ShapeGridItem(shapeType: editableShapeType))
                }
                Spacer()
                Button("Remove") {
                    guard let index = shapes.lastIndex(where: { $0.shapeType == editableShapeType }) else {
                        return // There are no more of the specific shapes in the list
                    }
                    shapes.remove(at: index)
                }
                Spacer()
            }
        }.navigationTitle("Edit \(editableShapeType.rawValue)s")
            .safeAreaPadding()
    }
}

#Preview {
    let testShapes = [
        ShapeGridItem(shapeType: .square),
        ShapeGridItem(shapeType: .circle),
        ShapeGridItem(shapeType: .triangle),
        ShapeGridItem(shapeType: .square),
        ShapeGridItem(shapeType: .circle),
        ShapeGridItem(shapeType: .triangle),
        ShapeGridItem(shapeType: .square),
        ShapeGridItem(shapeType: .circle),
        ShapeGridItem(shapeType: .triangle),
        ShapeGridItem(shapeType: .square),
        ShapeGridItem(shapeType: .circle),
        ShapeGridItem(shapeType: .triangle),
    ]
    EditableShapesView(editableShapeType: .circle, shapes: .constant(testShapes))
}
