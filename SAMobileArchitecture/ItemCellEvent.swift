//
//  ItemCellEvent.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 10/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class ItemCellEvent: Event {
    var model: BackendModel
    
    init(_ model: BackendModel) {
        self.model = model
    }
}

class ItemCellLikeEvent: ItemCellEvent {
    //
}

class ItemCellFavEvent: ItemCellEvent {
    //
}
