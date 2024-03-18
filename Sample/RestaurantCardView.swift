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
            VStack(alignment: .leading, content: {
                imageView
                HStack(alignment: .firstTextBaseline, content: {
                    infoView
                    Spacer()
                    starView
                })
                tagListView
                deliveryTimeView
            }).padding(designSystem.spacing.small)
        }
    }
    
    private var imageView: some View{
        Image("Image").background(.red)
    }
    
    private var infoView: some View{
        VStack (alignment: .leading, spacing: designSystem.spacing.small, content: {
            Text(viewModel.name)
                .font(designSystem.fontguide.title1)
                .foregroundColor(designSystem.palette.darkText)
        })
    }
    
    private var tagListView: some View {
        HStack(spacing: 1, content: {
            ForEach (viewModel.filters, id: \.self) { currentTag in
                Text(currentTag.prefix(3))
                    .font(designSystem.fontguide.subtitle1)
                    .foregroundColor(designSystem.palette.subtitle)
                if (currentTag != viewModel.filters.last) {
                    Text(".")
                        .font(designSystem.fontguide.subtitle1)
                        .foregroundColor(designSystem.palette.subtitle)
                }
            }
        })
    }
    
    private var deliveryTimeView: some View {
        HStack(alignment: .center, spacing: 8, content: {
            Image(.clockIcon)
                .frame(width: 5, height: 5)
                .foregroundColor(.red)
            Text("\(viewModel.deliveryTime) mins")
                .font(designSystem.fontguide.footer1)
       })
    }
    
    private var starView: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8, content: {
            Image(systemName: "star.fill")
                .frame(width: 12, height: 12)
                .foregroundColor(designSystem.palette.selected)
            Text(String(viewModel.rating))
                .font(designSystem.fontguide.title2)
        })
    }
    
    private var filterView: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8, content: {
            Image(systemName: "star.fill")
                .frame(width: 12, height: 12)
                .foregroundColor(designSystem.palette.selected)
            Text(String(viewModel.rating))
                .font(designSystem.fontguide.title2)
        })
    }
    
}
struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FeedRestaurant(id: "123",
                                       name: "Title",
                                       rating: "5",
                                       filters: ["Tag", "Tag"],
                                       imageURL: URL(string: "Top")!,
                                       deliveryTime: "30")
        RestaurantCardView(viewModel: viewModel)
    }
}
