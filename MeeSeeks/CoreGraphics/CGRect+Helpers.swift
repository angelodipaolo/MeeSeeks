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
    
    public func widthByPercent(percentage: CGFloat) -> CGFloat {
        return CGRectGetWidth(self) * percentage
    }
    
    public func heightByPercent(percentage: CGFloat) -> CGFloat {
        return CGRectGetHeight(self) * percentage
    }
}
