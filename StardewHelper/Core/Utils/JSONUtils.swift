//
//  JSONUtils.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 4/5/24.
//

import Foundation

// turn dictionary into JSON string
func dictionaryToJson(dictionary: [String: GameObject]) -> String {
    let encoder = JSONEncoder()
    if let jsonData = try? encoder.encode(dictionary) {
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
    }
    return ""
}

func fishDictionaryToJson(dictionary: [String: Fish]) -> String {
    let encoder = JSONEncoder()
    if let jsonData = try? encoder.encode(dictionary) {
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
    }
    return ""
}

func bundleDictionaryToJson(dictionary: [String: [BundleItem]]) -> String {
    let encoder = JSONEncoder()
    if let jsonData = try? encoder.encode(dictionary) {
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
    }
    return ""
}

func remixDictionaryToJson(dictionary: [String: [String]]) -> String {
    let encoder = JSONEncoder()
    if let jsonData = try? encoder.encode(dictionary) {
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
    }
    return ""
}

func convertToDictionary<T: Decodable>(text: String) -> T {
    if let data = text.data(using: .utf8) {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse Json text as \(T.self):\(error)")
        }
    }
    return [:] as! T
}
