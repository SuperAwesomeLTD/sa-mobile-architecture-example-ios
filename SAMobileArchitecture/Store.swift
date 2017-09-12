//
//  Store.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 10/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

typealias Reducer <S: State> = (S, Event) -> S
typealias Handler <S: State> = (S) -> Void

class Store <S: State> {
    
    private var reducer: Reducer<S>
    private var state: S
    private var handler: Handler<S>?
    
    private let bag = DisposeBag()
    
    init(state: S, reducer: @escaping Reducer<S>) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(_ event: Event) {
        self.state = self.reducer(self.state, event)
        self.handler?(self.state)
    }
    
    func dispatch(_ action: () -> Observable<Event>) {
        let observable = action()
        observable
            .subscribe(onNext: { event in
                self.state = self.reducer(self.state, event)
                self.handler?(self.state)
            })
            .addDisposableTo(bag)
    }
    
    func listen(forNewState withHandler: @escaping Handler<S>) {
        self.handler = withHandler
        self.handler?(self.state)
    }
}
