//
//  ShapesList.swift
//  CricutAssessment
//
//  Created by Calvin Armstrong on 10/19/25.
//

import Foundation
import SwiftUI

enum ShapeType: String {
    case circle = "circle"
    case square = "square"
    case triangle = "triangle"
}

struct ShapeGridItem: Identifiable {
    let id = UUID()
    let shapeType: ShapeType
    let shapeSize: CGFloat = 100
}
