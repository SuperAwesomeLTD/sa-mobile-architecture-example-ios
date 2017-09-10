//
//  Event.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

protocol Event {
    // do nothing
}

enum BackendEvent: Event {
    case loading
    case success(data: [BackendModel])
    case error
}

enum NavigationEvent: Event {
    case goto(segue: String)
}

enum ItemCellEvent: Event {
    case changed(model: BackendModel)
}
