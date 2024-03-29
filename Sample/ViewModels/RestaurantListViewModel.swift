//
//  RestaurantListViewModel.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import Combine
import Foundation

final class RestaurantListViewModel: ObservableObject {
    @Published private(set) var state = State.loadingList
    static var uniqueFilterList: [String] = []

    private var bag = Set<AnyCancellable>()
    private let input = PassthroughSubject<Event, Never>()
    private var service: DataFetchManager
    private static var currentList: [FeedRestaurant] = []

    init(service: DataFetchManager) {
        self.service = service
    }

    private func fetch(service: DataFetchManager) {
        Publishers.system(
            initial: state,
            reduce: Self.reduce,
            scheduler: RunLoop.main,
            feedbacks: [
                Self.whenLoading(service: service),
                Self.userInput(input: input.eraseToAnyPublisher())
            ]
        )
        .assign(to: \.state, on: self)
        .store(in: &bag)
    }

    deinit {
        bag.removeAll()
    }

    func send(event: Event) {
        switch event {
        case .onAppear(let query):
            if query.isEmpty {
                state = State.loadingList
                fetch(service: self.service)
            } else {
                let filteredRestaurants = RestaurantListViewModel.currentList.filter { restaurant in
                    query.contains { queryFilter in
                        restaurant.filters.contains(queryFilter)
                    }
                }
                state = State.loadedList(filteredRestaurants)
            }

        default:
            break
        }
    }
}
extension RestaurantListViewModel {
    // System states
    enum State {
        case loadingList
        case loadedList([FeedRestaurant])
        case error(Error)
        case empty
    }

    // UI events
    enum Event {
        case onAppear([String])
        case onDataLoaded(RestaurantsResponse)
        case onFailedToLoadData(Error)
    }
}
extension RestaurantListViewModel {
    // Reduce specifies how the state changes in response to an event
    static func reduce(_ state: State, _ event: Event) -> State {
        switch state {
        case .loadingList:
            switch event {
            case .onAppear:
                return state
            case .onDataLoaded(let response):
                let list = response.restaurants.map { $0.item }
                self.uniqueFilterList = list.uniqueFilters
                self.currentList = list
                return response.restaurants.isEmpty ? .empty : .loadedList(list)
            case .onFailedToLoadData(let error):
                return .error(error)
            }
        default:
            return state
        }
    }

    static func whenLoading(service: DataFetchManager) -> Feedback<State, Event> {
        Feedback {(state: State) -> AnyPublisher<Event, Never> in
            switch state {
            case .loadingList:
                return service.manager
                    .fetch(RestaurantListParameter())
                    .map(Event.onDataLoaded)
                    .catch { Just(Event.onFailedToLoadData($0)) }
                    .eraseToAnyPublisher()
            default:
                return Empty().eraseToAnyPublisher()
            }
        }
    }

    static func userInput(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
        Feedback { _ in input }
    }
}
