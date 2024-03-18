//
//  FilterParameter.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import Foundation

struct FilterParameter {
    let uuid: String
}

extension FilterParameter: Routing {
    var routePath: String {
        return "api/v1/filter/\(uuid)/"
    }
}
