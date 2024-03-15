//
//  DataFetchManager.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import Combine

protocol FetchManagerProtocol {
    func fetch<T: Decodable, R: Routing>(_ routing: R) -> AnyPublisher<T, Error>
}

class DataFetchManager {

    let manager: FetchManagerProtocol

    init(with fetchManager: FetchManagerProtocol) {
        manager = fetchManager
    }

    func execute<T: Decodable, R: Routing, E: Error>(_ route: R, errorType: E.Type) -> AnyPublisher<T, Error> {
        return manager.fetch(route)
    }
}
