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
    public static func decode(_ json: Any) -> T? {
        return T.decode(json)
    }
    /// Decode an array of JSON objects
    public static func decodeArray(_ json: [Any]) -> [T]? {
        var results = [T]()
        
        for j in json {
            if let result = T.decode(j) {
                results.append(result)
            }
        }
        
        return results
    }
}


