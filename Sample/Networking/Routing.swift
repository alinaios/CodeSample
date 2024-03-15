//
//  Routing.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import Foundation

protocol Routing {
    var baseURLString: String { get }
    var method: RequestType { get }
    var routePath: String { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var urlRequest: URLRequest? { get }
}

enum RequestType: String {
    case GET
    case POST
    case PUT
    case DELETE
}
