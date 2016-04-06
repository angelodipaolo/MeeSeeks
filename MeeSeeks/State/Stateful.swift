//
//  Stateful.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 9/24/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

/// Describes a type that is capable of entering a state.
public protocol Stateful: class {
    associatedtype StateType
    func shouldEnterState(state: StateType, fromPreviousState previousState: StateType) -> Bool
    func enteredState(state: StateType)
}
