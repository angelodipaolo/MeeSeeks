//
//  TableViewCellType.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 4/28/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation
import UIKit

public protocol TableViewCellType {
    static var reuseIdentifier: String {get}
}

public extension TableViewCellType {
    static var reuseIdentifier: String { return String(Self) }
}

public protocol NibBasedTableViewCellType: TableViewCellType, NibLoadable {}
