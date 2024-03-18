//
//  ContentView.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RestaurantListView(viewModel: RestaurantListViewModel(service: restaurantService))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
