//
//  AppReducer.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 14/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

func appReducer(_ previous: AppState, _ event: Event) -> AppState {
    return AppState(mainState: mainReducer(previous.mainState, event),
                    introState: introReducer(previous.introState, event))
}

func mainReducer(_ previous: MainState, _ event: Event) -> MainState {
    var state = previous
    
    if let event = event as? LoadBackendDataEvent {
        if let newData = event.data {
            state.hasError = false
            state.data += newData
        } else {
            state.hasError = true
        }
        state.isLoading = event.isLoading
    }
    else if let event = event as? ItemCellEvent {
        // do nothing
    }
    
    return state
}

func introReducer(_ previous: IntroState, _ event: Event) -> IntroState {
    var state = previous
    
    if event is SkipIntroEvent {
        state.shouldNavigate = true
    }
    
    return state
}


