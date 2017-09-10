//
//  Store.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 10/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

typealias Reducer <S: State> = (S, Event) -> S
typealias Handler <S: State> = (S) -> Void

class Store <S: State> {
    
    private var reducer: Reducer<S>
    private var state: S
    private var handler: Handler<S>?
    
    init(state: S, reducer: @escaping Reducer<S>) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(_ event: Event) {
        self.state = self.reducer(self.state, event)
        self.handler?(self.state)
    }
    
    func listen(forNewState withHandler: @escaping Handler<S>) {
        self.handler = withHandler
        self.handler?(self.state)
    }
}
