//
//  CompositionRoot.swift
//  Sample
//
//  Created by AH on 2024-03-17.
//

import Foundation

/// Networking related declarations
let projectBaseURL = "https://food-delivery.umain.io"
private let networkSessionManager = NetworkDataFetchManager()
let restaurantService = DataFetchManager(with: networkSessionManager)
let restaurantViewModel = RestaurantListViewModel(service: restaurantService)


/// Theme related declarations
private var fontguide =  ClassicFont()
private var palette = ClassicPalette()
private var layout = ClassicLayout()

let designSystem = DesignSystem(fontguide: fontguide, palette: palette, spacing: layout)
