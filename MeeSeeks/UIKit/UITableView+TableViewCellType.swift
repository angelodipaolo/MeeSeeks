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
    public func registerCellOfType<CellType: UITableViewCell where CellType: TableViewCellType>(_: CellType.Type) {
        registerClass(CellType.self, forCellReuseIdentifier: CellType.reuseIdentifier)
    }
    
    public func registerNibOfCellType<CellType: UITableViewCell where CellType: NibBasedTableViewCellType>(cellOfType: CellType.Type) {
        registerNib(CellType.nib, forCellReuseIdentifier: CellType.reuseIdentifier)
    }
    
    public func dequeueReusableCell<CellType: UITableViewCell where CellType: TableViewCellType>(indexPath indexPath: NSIndexPath) -> CellType {
        return dequeueReusableCellWithIdentifier(CellType.reuseIdentifier, forIndexPath: indexPath) as! CellType
    }
}
