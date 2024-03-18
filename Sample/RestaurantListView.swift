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
    @State private var query: String = String(localized: "default placeholder", comment: "search")

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

    private func loadedListView(list: [Restaurant]) -> some View {
        return NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20, content: {
//                    searchHeader(query: $query)
                    ForEach(list) { currentItem in
                        elementView(restaurant: currentItem)
                    }
                }).padding()
            }.navigationTitle("search").navigationBarTitleDisplayMode(.inline)
        }
    }

    private func elementView(restaurant: Restaurant) -> some View {
        RestaurantCardView(viewModel: restaurant)
//        NavigationLink(destination: RestaurantCardView(viewModel: ShowViewModel(show: show))) {
//            HStack(spacing: ProjectLayout.indent32, content: {
//                AsyncImage(url: URL(string: show.show.image?.medium ?? ""))
//                Text(show.show.name ?? "")
//            })
//        }
    }

//    private func searchHeader(query: Binding<String>) -> some View {
//        VStack(alignment: .leading, spacing: 20, content: {
//            SearchView(text: query, searchButtonHandler: {
//                viewModel.send(event: .onAppear(query.wrappedValue))
//            })
//        })
//    }

    private func emptyResultsView() -> some View {
        return NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20, content: {
//                    searchHeader(query: $query)
                    Text(String(localized: "no results \(query)", comment: "inquiry not found"))
                    Spacer()
                }).padding()
            }.navigationTitle("search").navigationBarTitleDisplayMode(.inline)
        }
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
