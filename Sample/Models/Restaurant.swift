//
//  Restaurant.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import Foundation

struct Restaurant: Identifiable, Decodable {
    let id: String
    let name: String
    let rating: Double
    let filterIds: [String]
    let image_url: URL
    let delivery_time_minutes: Int
}
