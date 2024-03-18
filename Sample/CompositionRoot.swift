//
//  CompositionRoot.swift
//  Sample
//
//  Created by AH on 2024-03-17.
//

import Foundation

let projectBaseURL = "https://food-delivery.umain.io"
let networkSessionManager = NetworkDataFetchManager()
let restaurantService = DataFetchManager(with: networkSessionManager)
let restaurantViewModel = RestaurantListViewModel(service: restaurantService)
