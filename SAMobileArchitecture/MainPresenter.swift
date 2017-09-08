//
//  MainPresenter.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

class MainPresenter/*: Presenter <Event, MainState, Result>*/ {

    var transformer: ComposeTransformer<Event, Result> {
        return { observable -> Observable<Result> in
            return observable
                .flatMap { event -> Observable<[BackendModel]> in
                    return BackendTask().execute(input: "").toArray()
                }
                .map { models -> BackendResult in
                    return BackendResult.success(data: models)
                }
                .catchErrorJustReturn(BackendResult.error)
                .startWith(BackendResult.loading)
        }
    }
    
    /*override*/ var initialState: MainState {
        return MainState.initial
    }
    
    func observe(stateForEvents events: Observable<Event>) -> Observable<MainState> {
        return events
            .compose(transformer)
            .scan(initialState, accumulator: reducer)
            .startWith(initialState)
    }
    
    func reducer(_ previous: MainState, _ result: Result) -> MainState {
        if let result = result as? BackendResult {
            switch result {
            case .loading:
                return MainState.loading
            case .success(let data):
                return MainState.success(data: data)
            case .error:
                return MainState.error
            }
        } else {
            return previous
        }
    }
    
}
