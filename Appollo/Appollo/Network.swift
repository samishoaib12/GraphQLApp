//
//  Network.swift
//  Appollo
//
//  Created by Avaib on 02/12/2025.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()

    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:8000/graphql")!)
}
