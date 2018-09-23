//
//  Serializable.swift
//  SquareDebts
//
//  Created by Denny Mathew on 23/09/18.
//  Copyright © 2018 Densigns. All rights reserved.
//

import Foundation

import Foundation

// MARK: - Protocol and Protocol Extension for Serializing Model Objects
protocol Serializable: Codable {
    func serialize() -> Data?
}

extension Serializable {
    func serialize() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}
