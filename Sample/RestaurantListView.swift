//
//  RestaurantListView.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import SwiftUI

struct RestaurantListView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<5, id: \.self) {_ in
                RestaurantCardView()
            }
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
