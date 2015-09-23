//
//  JSONDecoder.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 9/23/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation
import THGWebService

/// Provides an API for decoding JSONDecodable types.
public struct JSONDecoder {
    
    /// Decode a JSON object
    public static func decode(json: AnyObject, asType type: JSONDecodable.Type) -> JSONDecodable? {
        return type.decode(json)
    }
    /// Decode an array of JSON objects
    public static func decodeArray(json: [AnyObject], asType type: JSONDecodable.Type) -> [JSONDecodable]? {
        var results = [JSONDecodable]()
        
        for j in json {
            if let result = type.decode(j) {
                results.append(result)
            } else {
                return nil
            }
        }
        
        return results
    }
}


