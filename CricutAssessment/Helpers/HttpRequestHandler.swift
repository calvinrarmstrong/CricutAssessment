//
//  HttpRequestHandler.swift
//  CricutAssessment
//
//  Created by Calvin Armstrong on 10/19/25.
//
//  Sources Used:
//  https://cocoacasts.com/networking-fundamentals-how-to-make-an-http-request-in-swift
//  https://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift
//  https://medium.com/ios-app-development-concepts/encodable-decodable-and-codable-in-swift-483d6c3c4e07
//  https://stackoverflow.com/questions/24018327/what-does-an-exclamation-mark-mean-in-the-swift-language
//  https://stackoverflow.com/questions/25195565/how-do-you-unwrap-swift-optionals
//  https://stackoverflow.com/questions/31443645/simplest-way-to-throw-an-error-exception-with-a-custom-message-in-swift
//  https://stackoverflow.com/questions/32631184/the-resource-could-not-be-loaded-because-the-app-transport-security-policy-requi
//  https://www.hackingwithswift.com/books/ios-swiftui/working-with-identifiable-items-in-swiftui

import Foundation

enum RequestError: Error {
    case urlError(String)
    
}

struct ShapeButtons: Decodable {
    let buttons: [ShapeButton]
}


struct ShapeButton: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let drawPath: String

    enum CodingKeys: String, CodingKey{
        case name = "name"
        case drawPath = "draw_path"
    }
}

class HttpRequestHandler {
    let baseurl = "http://staticcontent.cricut.com/"
    
    func getShapeButtons() async throws -> ShapeButtons{
        let url = URL(string: "\(baseurl)static/test/shapes_001.json")
        if url != nil {
            //  Request and decode buttons from the json response
            let request = URLRequest(url: url!)
            let (data, _) = try await URLSession.shared.data(for: request)
            let buttons: ShapeButtons = try JSONDecoder().decode(ShapeButtons.self, from: data)
            return buttons
        }
        throw RequestError.urlError("The url was invalid and returned a nil value")
    }
}
