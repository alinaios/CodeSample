//
//  RestaurantCard.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import SwiftUI

struct RestaurantCardView: View {
    @State var viewModel: Restaurant

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
                ForEach (viewModel.filterIds, id: \.self) { currentTag in
                    Text(currentTag.prefix(3))
                    if (currentTag != viewModel.filterIds.last) {
                        Text("*")
                    }
                }
            }
            HStack {
            Image(systemName: "clock")
                    .frame(width: 8, height: 8)
                    .foregroundColor(.red)
                Text("\(viewModel.delivery_time_minutes) mins")
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

//struct RestaurantCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantCardView(viewModel: RestaurantCardViewModel(service: restaurantService, restaurant: Restaurant))
//    }
//}
