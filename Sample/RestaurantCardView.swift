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
                .font(designSystem.fontguide.title1)
                .foregroundColor(designSystem.palette.darkText)
            HStack {
                ForEach (viewModel.filters, id: \.self) { currentTag in
                    Text(currentTag.prefix(3))
                        .font(designSystem.fontguide.subtitle1)
                        .foregroundColor(designSystem.palette.subtitle)

                    if (currentTag != viewModel.filters.last) {
                        Text("*")
                            .font(designSystem.fontguide.subtitle1)
                            .foregroundColor(designSystem.palette.subtitle)
                    }
                }
            }
            HStack {
            Image(systemName: "clock")
                    .frame(width: 8, height: 8)
                    .foregroundColor(.red)
                Text("\(viewModel.deliveryTime) mins")
                    .font(designSystem.fontguide.footer1)
           }
        }).padding(8)
    }
    
    private var starView: some View {
        HStack(alignment: .firstTextBaseline, spacing: 3, content: {
            Image(systemName: "star").foregroundColor(.red)
            Text(String(viewModel.rating))
                .font(designSystem.fontguide.subtitle1)
        })
    }
}
struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FeedRestaurant(id: "123",
                                       name: "Hello pizzza",
                                       rating: "12",
                                       filters: ["Top", "best"],
                                       imageURL: URL(string: "Top")!,
                                       deliveryTime: "60")
        RestaurantCardView(viewModel: viewModel)
    }
}
