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
    var mainState: MainState
    var introState: IntroState
    
    static func initial() -> AppState {
        return AppState(mainState: MainState(data: [], isLoading: false, hasError: false),
                        introState: IntroState(shouldNavigate: false))
    }
}

struct IntroState: State {
    var shouldNavigate: Bool
}

struct MainState: State {
    var data: [BackendModel]
    var isLoading: Bool
    var hasError: Bool
}

