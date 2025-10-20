//
//  ContentView.swift
//  CricutAssessment
//
//  Created by Calvin Armstrong on 10/19/25.
//
//  Sources
//  https://learnxinyminutes.com/swift/
//  https://www.youtube.com/watch?v=zS3VuuCQod4
//  https://developer.apple.com/documentation/swiftui/foreach
//  https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-an-alert
//  https://www.youtube.com/watch?v=y_AMJ3UXP4Y&t=1s

import SwiftUI

struct AllShapesView: View {
    
    @State var dynamicButtons = DynamicShapeButtons()
    @State var shapes: [ShapeGridItem] = []
    let editableShape = ShapeType.circle
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                // Header
                HStack {
                    Button("Clear All") {
                        shapes = []
                    }.padding(.leading)
                    Spacer()
                    NavigationLink("Edit \(editableShape.rawValue)s") {
                        EditableShapesView(editableShapeType: editableShape, shapes: $shapes)
                    }.padding(.trailing)
                }
                
                // Scrollable grid view for shapes
                ShapesGridView(shapes: $shapes)

                // Footer
                HStack {
                    // Display each button with spaces between
                    Spacer()
                    ForEach(dynamicButtons.buttons) { button in
                        Button(button.name) {
                            let shape = ShapeType(rawValue: button.drawPath)
                            if shape != nil {
                                shapes.append(ShapeGridItem(shapeType: shape!))
                            } else {
                                print("Recieved an invalid draw path from the buttons request: \(button.drawPath)")
                                dynamicButtons.hadError = true
                            }
                        }
                        Spacer()
                    }
                }
                .padding()
                .alert("Shape Buttons", isPresented: $dynamicButtons.hadError) {
                } message: {
                    Text("There was an issue getting the shape buttons. Please contact customer support for more help.")
                }
            }
        }
    }
}

#Preview {
    AllShapesView()
}
