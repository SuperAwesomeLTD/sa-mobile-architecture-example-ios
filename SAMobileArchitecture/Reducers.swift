//
//  AppReducer.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 14/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

func appReducer(_ previous: AppState, _ event: Event) -> AppState {
    return AppState(introState: introReducer(previous.introState, event),
                    mainState: mainReducer(previous.mainState, event))
}

func mainReducer(_ previous: MainState, _ event: Event) -> MainState {
    let state = previous
    
    if let event = event as? LoadBackendDataEvent {
        
        if event.isLoading {
            return MainState.isLoading
        }
        else if let newData = event.data {
            return MainState.hasData(data: newData)
        }
        else {
            return state
        }
        
    }
    else if event is SetupMainController {
        return MainState.initial
    }
    else if event is ItemCellEvent {
        return MainState.changeData
    }
    
    return state
}

func introReducer(_ previous: IntroState, _ event: Event) -> IntroState {
    let state = previous
    
    if event is SkipIntroEvent {
        return IntroState.gotoMain
    }
    
    return state
}


