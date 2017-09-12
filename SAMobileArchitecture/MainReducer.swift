//
//  MainReducer.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 12/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

func mainReducer(_ previous: MainState, _ event: Event) -> MainState {
    
    if let event = event as? LoadBackendDataEvent {
        
        if let data = event.data {
            return MainState.success(data: data)
        } else if event.isLoading {
            return MainState.loading
        } else {
            return MainState.error
        }
        
    } else {
        return previous
    }
}
