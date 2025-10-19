//
//  ContentView.swift
//  CricutAssessment
//
//  Created by Calvin Armstrong on 10/19/25.
//
//  Sources
//  https://learnxinyminutes.com/swift/
//  https://developer.apple.com/documentation/swiftui/foreach
//  https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-an-alert

import SwiftUI

struct ShapesGridView: View {
    
    @State var dynamicButtons = DynamicShapeButtons()
    
    var body: some View {

        Spacer() // Temporary spacer
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

#Preview {
    ShapesGridView()
}
