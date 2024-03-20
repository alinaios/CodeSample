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
    @State private var query: [String] = []
    @State private var selectedFilters: [Bool] = Array(repeating: false, count: 10)

    var body: some View {
        content.onAppear {
            viewModel.send(event: .onAppear(query))
        }
    }

    private var content: some View {
        switch viewModel.state {
        case .loadingList:
            return ProgressView().eraseToAnyView()
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
                filterView(filters: RestaurantListViewModel.uniqueFilterList)
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
    
    private func filterView(filters: [String]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (alignment: .center, spacing: designSystem.spacing.small, content: {
                Spacer()
                ForEach(filters.indices, id: \.self) { index in
                    let filter = filters[index]
                    FilterButton(isSelected: $selectedFilters[index],
                                 title: filter,
                                 image: Image(.topRated),
                                 action: {
                        if selectedFilters[index]  {
                            query.append(filter)
                        } else {
                            query.removeAll(where: { $0 == filter })
                        }
                        viewModel.send(event: .onAppear(query))
                    })
                    Spacer()
                }
            })
        }.padding(designSystem.spacing.large)
    }
    
    private func elementView(restaurant: FeedRestaurant) -> some View {
        RestaurantCardView(viewModel: restaurant)
    }

    private func emptyResultsView() -> some View {
        return RoundedCardView {
            Text("No items to display" )
                .font(designSystem.fontguide.title2)
                .foregroundColor(designSystem.palette.darkText)
        }.padding()
    }

    private func errorView(error: Error) -> some View {
        return VStack(alignment: .center, spacing: designSystem.spacing.medium, content: {
            Text("Failed to load data. Tap 'Retry' to try again." )
                .font(designSystem.fontguide.title2)
                .foregroundColor(designSystem.palette.darkText)
            Button("Retry") {
                viewModel.send(event: .onAppear(query))
            }
            .font(designSystem.fontguide.title2)
            .foregroundColor(designSystem.palette.positive)
        }).padding()
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(viewModel: RestaurantListViewModel(service: restaurantService))
    }
}
