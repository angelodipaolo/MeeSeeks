//
//  ServiceTask+JSON.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 9/23/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation
import THGWebService

/// JSON extension for Swallow (THGWebService)
extension ServiceTask {
    
    public func decodeJSONForKey(key: String?, asType type: JSONDecodable.Type, handler: ([JSONDecodable]) -> Void) -> Self {
        return responseJSON { json in
            if let json = self.jsonObject(json, forKey: key),
                let jsonArray = json as? [AnyObject],
                let decodedArray = JSONDecoder.decodeArray(jsonArray, asType: type) {
                    handler(decodedArray)
            } else {
                self.throwError(ServiceTaskDecodeError.FailedToDecodeJSONArray)
                return
            }
        }
    }
    
    public func decodeJSONForKey(key: String?, asType type: JSONDecodable.Type, handler: (JSONDecodable) -> Void) -> Self {
        return responseJSON { json in
            
            if let decodedObject = JSONDecoder.decode(json, asType: type) {
                handler(decodedObject)
            } else {
                self.throwError(ServiceTaskDecodeError.FailedToDecodeJSONObject)
                return
            }
            
        }
    }
    
    private func jsonObject(json: AnyObject, forKey key: String?) -> AnyObject? {
        if let key = key {
            return json[key]
        } else {
            return json
        }
        
    }
}

enum ServiceTaskDecodeError: ErrorType {
    case FailedToDecodeJSONArray
    case FailedToDecodeJSONObject
}