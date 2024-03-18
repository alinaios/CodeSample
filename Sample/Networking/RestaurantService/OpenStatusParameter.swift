//
//  OpenStatusParameter.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import Foundation

struct OpenStatusParameter {
    let id: String
}

extension OpenStatusParameter: Routing {
    var routePath: String {
        return "api/v1/open/\(id)/"
    }
}
