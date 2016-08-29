//
//  CGRect+Helpers.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 9/25/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    public var center: CGPoint { return CGPoint(x: midX, y: midY) }
    
    public func widthByPercent(_ percentage: CGFloat) -> CGFloat {
        return self.width * percentage
    }
    
    public func heightByPercent(_ percentage: CGFloat) -> CGFloat {
        return self.height * percentage
    }
}
