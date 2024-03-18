//
//  RestaurantsResponse.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import Foundation

struct RestaurantsResponse: Decodable {
    let restaurants: [APIRestaurant]
}
