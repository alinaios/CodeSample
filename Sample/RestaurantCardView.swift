//
//  RestaurantCard.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import SwiftUI

struct RestaurantCardView: View {
    @State var viewModel: FeedRestaurant

    var body: some View {
        RoundedCardView {
            VStack(alignment: .center, spacing: 8, content: {
                Image("Image")
                HStack(alignment: .firstTextBaseline, content: {
                    titleView
                    Spacer()
                    starView
                })
            }).padding(8)
        }
    }
    
    private var titleView: some View{
        VStack (alignment: .leading, content: {
            Text(viewModel.name)
            HStack {
                ForEach (viewModel.filters, id: \.self) { currentTag in
                    Text(currentTag.prefix(3))
                    if (currentTag != viewModel.filters.last) {
                        Text("*")
                    }
                }
            }
            HStack {
            Image(systemName: "clock")
                    .frame(width: 8, height: 8)
                    .foregroundColor(.red)
                Text("\(viewModel.deliveryTime) mins")
           }
        }).padding(8)
    }
    
    private var starView: some View {
        HStack(alignment: .firstTextBaseline, spacing: 3, content: {
            Image(systemName: "star").foregroundColor(.red)
            Text(String(viewModel.rating))
        })
    }
}
