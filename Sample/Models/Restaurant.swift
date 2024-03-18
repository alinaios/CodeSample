//
//  Restaurant.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import Foundation

struct RestaurantsResponse: Decodable {
    let restaurants: [APIRestaurant]
}

struct APIRestaurant: Identifiable, Decodable {
    let id: String
    let name: String
    let rating: Double
    let filterIds: [String]
    let image_url: URL
    let delivery_time_minutes: Int
    
    var item: FeedRestaurant {
        return FeedRestaurant(id: id, name: name, rating: String(rating),
                              filters: filterIds.map{String($0.prefix(3))},
                              imageURL: image_url,
                              deliveryTime: String(delivery_time_minutes))
    }
}

public struct FeedRestaurant: Identifiable, Hashable {
    public let id: String
    public let name: String
    public let rating: String
    public let filters: [String]
    public let imageURL: URL
    public let deliveryTime: String
}
