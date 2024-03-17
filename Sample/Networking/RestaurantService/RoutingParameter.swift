//
//  RoutingParameter.swift
//  Sample
//
//  Created by AH on 2024-03-17.
//

import Foundation

struct RoutingParameter {
    let query: String
}
extension RoutingParameter: Routing {
    var routePath: String {
        return "api/v1/restaurants"
    }
}
