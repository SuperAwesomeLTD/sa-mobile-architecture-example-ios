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
        return AppState(introState: IntroState(),
                        mainState: MainState())
    }
}

struct IntroState: State {
    var shouldAdvance: Bool = false
}

struct MainState {
    var data: [BackendModel] = []
    var isLoading: Bool = false
    var hasError: Bool = false
    var hasData: Bool = false
    var isChanged: Bool = false
}
