//
//  StateMachine.swift
//  MeeSeeks
//
//  Created by Angelo Di Paolo on 9/26/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

/// Lightweight class for managing a finite state machine
public class StateMachine<S: Stateful> {
    private unowned var owner: S
    
    /// The current state of the machine.
    public var state: S.StateType {
        didSet {
            if owner.shouldEnterState(state, fromPreviousState: oldValue) {
                owner.enteredState(state)
            }
        }
    }
    
    /// Initialize with an initial state and the Stateful owner.
    public init(state: S.StateType, owner: S) {
        self.state = state
        self.owner = owner
        owner.enteredState(state)
    }
}
