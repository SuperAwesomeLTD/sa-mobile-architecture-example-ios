//
//  IntroPresenter.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

class IntroPresenter: Presenter<NavigationEvent, IntroState, NavigationResult> {

    override var transformer: ComposeTransformer<NavigationEvent, NavigationResult> {
        return { observable -> Observable<NavigationResult> in
            return observable.map { event -> NavigationResult in
                return NavigationResult.goto(segue: event.segue)
            }
        }
    }
    
    override var initialState: IntroState {
        return IntroState.initial
    }
    
    override func reducer(_ previous: IntroState, _ result: NavigationResult) -> IntroState {
        switch result {
        case .goto(let segue):
            return IntroState.goto(segue: segue)
        }
    }
}
