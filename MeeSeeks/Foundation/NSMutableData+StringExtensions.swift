//
//  NSMutableData+StringExtensions.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 11/7/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

public extension NSMutableData {
    /// Appends the value of a Swift String to the receiver.
    func appendString(_ string: String) {
        if let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true) {
            append(data)
        }
    }
}
