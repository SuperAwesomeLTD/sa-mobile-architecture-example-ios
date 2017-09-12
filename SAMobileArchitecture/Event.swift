//
//  Event.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

protocol Event {}

struct LoadBackendDataEvent: Event {
    var data: [BackendModel]?
    var isLoading: Bool
}

struct NavigationEvent: Event {
    var segue: String
}

enum ItemCellEvent: Event {
    case changed(model: BackendModel)
}
