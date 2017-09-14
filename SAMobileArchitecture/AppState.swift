//
//  AppState.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 14/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

struct AppState: State {
    var data: [BackendModel]
    var isLoading: Bool
    var hasError: Bool
    
    static func initial () -> AppState {
        return AppState(data: [], isLoading: false, hasError: false)
    }
}
