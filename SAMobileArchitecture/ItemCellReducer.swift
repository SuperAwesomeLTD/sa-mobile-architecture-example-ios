//
//  ItemCellReducer.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 12/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

func itemCellReducer(_ previous: ItemCellState, _ event: Event) -> ItemCellState {
    if event is ItemCellEvent {
        return ItemCellState.changed
    } else {
        return previous
    }
}
