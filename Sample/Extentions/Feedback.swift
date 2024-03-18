//
//  Feedback.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import Combine

struct Feedback<State, Event> {
    let run: (AnyPublisher<State, Never>) -> AnyPublisher<Event, Never>
}
extension Feedback {
    init<Effect: Publisher>(effects: @escaping (State) -> Effect)
    where Effect.Output == Event, Effect.Failure == Never {
        self.run = { state -> AnyPublisher<Event, Never> in
            state
                .map { effects($0) }
                .switchToLatest()
                .eraseToAnyPublisher()
        }
    }
}
