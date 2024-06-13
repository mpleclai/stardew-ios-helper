//
//  Furniture.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/25/24.
//

import Foundation

struct Furniture: Hashable, Codable, Identifiable {
    let id: String
    let name: String
    let type: String
    let price: Int
    enum CodingKeys: String, CodingKey {
        case id, name, type, price
    }
}

//https://stackoverflow.com/questions/46597624/can-swift-convert-a-class-struct-data-into-dictionary
// struct JSON {
//    static let encoder = JSONEncoder()
// }
// extension Encodable {
//    subscript(key: String) -> Any? {
//        return dictionary[key]
//    }
//    var dictionary: [String: Any] {
//        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
//    }
// }
