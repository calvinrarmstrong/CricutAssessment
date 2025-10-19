//
//  EditableShapesView.swift
//  CricutAssessment
//
//  Created by Calvin Armstrong on 10/19/25.
//
//  Sources
//  https://stackoverflow.com/questions/78414946/how-to-extend-content-view-beneath-the-navigation-bar-in-swiftui

import SwiftUI

struct EditableShapesView: View {
    var shapeName: String
    var body: some View {
        VStack{
            // Scrollable grid view for shapes
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]) {
                    ForEach(0..<10){ index in
                        Rectangle()
                            .frame(height: 50)
                    }
                }
            }
            // Footer
            HStack {
                
                // Display each button with spaces between
                Spacer()
                
                Button("Delete All"){
                    
                }
                Spacer()
                Button("Add"){
                    
                }
                Spacer()
                Button("Remove"){
                    
                }
                Spacer()
            }
        }.navigationTitle("Edit \(shapeName)s")
            .safeAreaPadding()
    }
    
    init(shapeName: String) {
        self.shapeName = shapeName
    }
}

#Preview {
    EditableShapesView(shapeName: "circle")
}
