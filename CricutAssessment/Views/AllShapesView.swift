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
    let editableShape = "Circle"
    
    var body: some View {
        
        
        NavigationView {
            VStack{
                HStack {
                    Button("Clear All"){
                        
                    }.padding(.leading)
                    Spacer()
                    NavigationLink("Edit \(editableShape)s"){
                        EditableShapesView(shapeName: editableShape)
                    }.padding(.trailing)
                }
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
                    ForEach(dynamicButtons.buttons){ button in
                        Button(button.name){
                            
                        }
                        Spacer()
                    }
                }
                .padding()
                .alert("Shape Buttons", isPresented: $dynamicButtons.hadError){
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
