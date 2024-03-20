//
//  DetailCardView.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import SwiftUI

struct DetailCardView: View {
    @State var viewModel: FeedRestaurant

    var body: some View {
        ZStack{
            imageView(imageURL: viewModel.imageURL)
            RoundedCardView(corners: [.allCorners], height: 144) {
                infoView
            }.offset(CGSize(width: 0, height: -80))
            .padding(designSystem.spacing.medium*2)
        }
    }
    
    private func imageView(imageURL: URL) -> some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    Spacer()
                default:
                    Image(.image)
                        .frame(maxWidth: .infinity, maxHeight: 250)
                    Spacer()
                }
            }
    }
    
    private var infoView: some View{
        VStack (alignment: .leading, spacing: designSystem.spacing.small, content: {
            HStack{
                Text(viewModel.name)
                    .font(designSystem.fontguide.headline1)
                    .foregroundColor(designSystem.palette.darkText)
                Spacer()
            }
            tagListView
        }).padding(designSystem.spacing.medium)
    }
    
    private var tagListView: some View {
        HStack(spacing: 1, content: {
            ForEach (viewModel.filters, id: \.self) { currentTag in
                Text(currentTag.prefix(3))
                    .font(designSystem.fontguide.title1)
                    .foregroundColor(designSystem.palette.subtitle)
                if (currentTag != viewModel.filters.last) {
                    Text(".")
                        .font(designSystem.fontguide.subtitle1)
                        .foregroundColor(designSystem.palette.subtitle)
                }
            }
        })
    }
}
struct DetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FeedRestaurant(id: "123",
                                       name: "Title",
                                       rating: "5",
                                       filters: ["Tag", "Tag"],
                                       imageURL: URL(string: "Top")!,
                                       deliveryTime: "30 min")
        DetailCardView(viewModel: viewModel)
    }
}
