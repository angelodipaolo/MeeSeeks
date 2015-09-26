//
//  CGRect+Helpers.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 9/25/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    
    public var calculatedWidth: CGFloat { return CGRectGetWidth(self) }
    public var calculatedHeight: CGFloat { return CGRectGetHeight(self) }
    
    public var midX: CGFloat { return CGRectGetMidX(self) }
    public var midY: CGFloat { return CGRectGetMidY(self) }
    
    public var center: CGPoint { return CGPoint(x: midX, y: midY) }
    
    public func widthByPercent(percentage: CGFloat) -> CGFloat {
        return CGRectGetWidth(self) * percentage
    }
    
    public func heightByPercent(percentage: CGFloat) -> CGFloat {
        return CGRectGetHeight(self) * percentage
    }
}
