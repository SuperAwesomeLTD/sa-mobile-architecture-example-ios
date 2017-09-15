//
//  AppState.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 14/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

protocol State {}

struct AppState: State {
    var introState: IntroState
    var mainState: MainState
    
    static func initial() -> AppState {
        return AppState(introState: IntroState.initial,
                        mainState: MainState.initial)
    }
}

enum IntroState: State {
    case initial
    case gotoMain
}

enum MainState {
    case initial
    case isLoading
    case hasData(data: [BackendModel])
    case changeData
    case error
}

