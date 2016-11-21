//
//  UITableView+TableViewCellType.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 4/28/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    public func registerCellOfType<CellType: UITableViewCell>(_: CellType.Type) where CellType: TableViewCellType {
        register(CellType.self, forCellReuseIdentifier: CellType.reuseIdentifier)
    }
    
    public func registerNibOfCellType<CellType: UITableViewCell>(_ cellOfType: CellType.Type) where CellType: NibBasedTableViewCellType {
        register(CellType.nib, forCellReuseIdentifier: CellType.reuseIdentifier)
    }
    
    public func dequeueReusableCell<CellType: UITableViewCell>(indexPath: IndexPath) -> CellType where CellType: TableViewCellType {
        return self.dequeueReusableCell(withIdentifier: CellType.reuseIdentifier, for: indexPath) as! CellType
    }
}
