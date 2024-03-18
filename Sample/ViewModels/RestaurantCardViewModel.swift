//
//  RestaurantCardViewModel.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//
//import Foundation
//import Combine
//
//final class RestaurantCardViewModel: ObservableObject {
//    @Published private(set) var state = State.loading
//    private var bag = Set<AnyCancellable>()
//    private let input = PassthroughSubject<Event, Never>()
//    private var service: DataFetchManager
//    var restaurant: Restaurant
//    
//    init(service: DataFetchManager, restaurant: Restaurant) {
//        self.service = service
//        self.restaurant = restaurant
//    }
//
//    private func fetch(service: DataFetchManager) {
//        Publishers.system(
//            initial: state,
//            reduce: Self.reduce,
//            scheduler: RunLoop.main,
//            feedbacks: [
//                Self.whenLoading(service: service, restaurantId: restaurant.id),
//                Self.userInput(input: input.eraseToAnyPublisher())
//            ]
//        )
//        .assign(to: \.state, on: self)
//        .store(in: &bag)
//    }
//
//    deinit {
//        bag.removeAll()
//    }
//
//    func send(event: Event) {
//        switch event {
//        case .onAppear:
//            state = State.loading
//            fetch(service: self.service)
//        default:
//            break
//        }
//    }
//}
//extension RestaurantCardViewModel {
//    // System states
//    enum State {
//        case loading
//        case loaded(OpenStatus)
//        case error(Error)
//    }
//
//    // UI events
//    enum Event {
//        case onAppear(String)
//        case onDataLoaded(OpenStatus)
//        case onFailedToLoadData(Error)
//    }
//}
//extension RestaurantCardViewModel {
//    // Reduce specifies how the state changes in response to an event
//    static func reduce(_ state: State, _ event: Event) -> State {
//        switch state {
//        case .loading:
//            switch event {
//            case .onAppear:
//                return state
//            case .onDataLoaded(let response):
//                return response
//            case .onFailedToLoadData(let error):
//                return .error(error)
//            }
//        default:
//            return state
//        }
//    }
//
//    static func whenLoading(service: DataFetchManager, restaurantId: String) -> Feedback<State, Event> {
//        Feedback {(state: State) -> AnyPublisher<Event, Never> in
//            switch state {
//            case .loading:
//                return service.manager
//                    .fetch(OpenStatusParameter(id: restaurantId))
//                    .map(Event.onDataLoaded)
//                    .catch { Just(Event.onFailedToLoadData($0)) }
//                    .eraseToAnyPublisher()
//            default:
//                return Empty().eraseToAnyPublisher()
//            }
//        }
//    }
//
//    static func userInput(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
//        Feedback { _ in input }
//    }
//}
//
