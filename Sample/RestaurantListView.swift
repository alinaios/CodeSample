//
//  RestaurantListView.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import SwiftUI

struct RestaurantListView: View {
    @ObservedObject var viewModel: RestaurantListViewModel
    @State private var isShowingDetailView = false
    @State private var isLoading = true
    @State private var query: String = ""

    var body: some View {
        content.onAppear {
            viewModel.send(event: .onAppear(query))
        }
    }

    private var content: some View {
        switch viewModel.state {
        case .loadingList:
            return ActivityView(isAnimating: $isLoading).eraseToAnyView()
        case .loadedList(let list):
            return loadedListView(list: list).eraseToAnyView()
        case .error(let error):
            return errorView(error: error).eraseToAnyView()
        case .empty:
            return emptyResultsView().eraseToAnyView()
        }
    }

    private func loadedListView(list: [FeedRestaurant]) -> some View {
        return NavigationStack {
            VStack {
                filterView()
                ScrollView {
                    VStack(alignment: .leading, spacing: designSystem.spacing.medium, content: {
                        ForEach(list) { currentItem in
                            elementView(restaurant: currentItem)
                        }
                    }).padding()
                }
            }
        }
    }
    
    private func filterView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (alignment: .center, spacing: designSystem.spacing.small, content: {
                Spacer()
                FilterButton(title: "Top Rated", image: Image(.topRated), action: {
                    viewModel.send(event: .onAppear("Top Rated"))
                    print("Top Rated")
                })
                FilterButton(title: "Take Out", image: Image(.topRated), action: {
                    viewModel.send(event: .onAppear("Take Out"))
                    print("Take Out")
                })
            })
        }.padding(designSystem.spacing.small)
    }
    
    private func elementView(restaurant: FeedRestaurant) -> some View {
        RestaurantCardView(viewModel: restaurant)
    }

    private func emptyResultsView() -> some View {
        return VStack(alignment: .leading, spacing: designSystem.spacing.medium, content: {
            Text("no results")
            Spacer()
        })
    }

    private func errorView(error: Error) -> some View {
        return Button("Retry") {
            viewModel.send(event: .onAppear(query))
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(viewModel: RestaurantListViewModel(service: restaurantService))
    }
}
