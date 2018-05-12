//
//  TableViewCellType.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 4/28/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation
import UIKit

public protocol ViewCellType {
    static var reuseIdentifier: String {get}
}

public extension ViewCellType {
    static var reuseIdentifier: String { return String(describing: self) }
}

public protocol NibBasedViewCellType: ViewCellType, NibLoadable {}
