//
//  DynamicButtons.swift
//  CricutAssessment
//
//  Created by Calvin Armstrong on 10/19/25.
//
//  Sources
//  https://www.youtube.com/watch?v=XRulkUR1O5Q
//  https://nilcoalescing.com/blog/ObservableInSwiftUI/

import Foundation

@Observable
class DynamicShapeButtons{
    var buttons: [ShapeButton] = []
    var hadError: Bool = false
    init(){
        Task{
            do{
                buttons = try await HttpRequestHandler().getShapeButtons().buttons
            } catch {
                print(error)
                hadError = true
            }
        }
    }
}
