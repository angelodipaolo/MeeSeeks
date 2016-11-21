//
//  JSONDecodable.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 9/23/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

/// Describes a type that can be created by decoding JSON.
public protocol JSONDecodable {
    static func decode(_ json: AnyObject) -> Self?
}
