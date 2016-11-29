//
//  JSONDecoder.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 9/23/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

/// Provides an API for decoding JSONDecodable types.
public struct JSONDecoder<T: JSONDecodable> {
    
    /// Decode a JSON object
    public static func decode(json: [String: Any]) throws -> T? {
        return try T(json: json)
    }
    /// Decode an array of JSON objects
    public static func decode(jsonArray: [[String: Any]]) throws -> [T]? {
        var results = [T]()
        
        for j in jsonArray {
            if let result = try T(json: j) {
                results.append(result)
            }
        }
        
        return results
    }
}


