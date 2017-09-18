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

func introReducer(_ previous: IntroState, _ event: Event) -> IntroState {
    let state = previous
    
    if event is SkipIntroEvent {
        return IntroState(shouldAdvance: true)
    }
    
    return state
}

func mainReducer(_ previous: MainState, _ event: Event) -> MainState {
    var state = previous
    
    if let event = event as? LoadBackendDataEvent {
        state.isChanged = false
        state.data += event.data
        state.hasData = state.data.count > 0
        state.hasError = event.hasError
        state.isLoading = event.isLoading
    }
    else if let event = event as? ItemCellLikeEvent {
        state.data.forEach { model in
            if model === event.model {
                model.isLiked = !model.isLiked
            }
        }
        state.isChanged = true
    }
    else if let event = event as? ItemCellFavEvent {
        state.data.forEach { model in
            if model === event.model {
                model.isFavourite = !model.isFavourite
            }
        }
        state.isChanged = true
    }
    else if let event = event as? DeleteFavouriteEvent {
        state.data.forEach { model in
            if model === event.model {
                model.isFavourite = false
            }
        }
        state.isChanged = true
    }
    else if event is GetFavouritesEvent {
        return previous
    }
    
    return state
}



