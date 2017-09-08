//
//  Presenter.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

class Presenter <E: Event, S: State, R: Result> {

    var transformer: ComposeTransformer<E, R> {
        fatalError("Must implement transformer")
    }
    
    var initialState: S {
        fatalError("Must specify an initial state")
    }
    
    func observe(stateForEvents events: Observable<E>) -> Observable<S> {
        return events
            .compose(transformer)
            .scan(initialState, accumulator: reducer)
            .startWith(initialState)
    }

    func reducer(_ previous: S, _ result: R) -> S {
        fatalError("Must implement reducer")
    }
}
