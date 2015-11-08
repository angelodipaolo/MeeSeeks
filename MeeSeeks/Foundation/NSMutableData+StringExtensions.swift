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
    func appendString(string: String) {
        if let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) {
            appendData(data)
        }
    }
}
