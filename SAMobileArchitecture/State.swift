//
//  AppState.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 14/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

struct AppState: State {
    var introState: IntroState = IntroState()
    var mainState: MainState = MainState()
}

struct IntroState: State {
    var shouldAdvance: Bool = false
}

struct MainState: State {
    var fullData: [BackendModel] = []
    var isLoading: Bool = false
    var hasError: Bool = false
    var hasData: Bool = false
    var isChanged: Bool = false
    var searchTerm: String?
    
    var data: [BackendModel] {
        return self.fullData.filter { model -> Bool in
            if let filter = self.searchTerm, filter != "" {
                return model.text.lowercased().contains(filter.lowercased())
            } else {
                return true
            }
        }
    }
    
    var favourites: [BackendModel] {
        return self.fullData.filter { model -> Bool in
            return model.isFavourite
        }
    }
}
