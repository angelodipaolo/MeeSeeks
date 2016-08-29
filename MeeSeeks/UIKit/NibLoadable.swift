//
//  NibLoadable.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 4/28/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation
import UIKit

public protocol NibLoadable {
    static var nib: UINib? {get}
}

public extension NibLoadable {
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
