//
//  MainState.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

enum MainState: State {
    case initial
    case loading
    case success(data: [BackendModel])
    case error
}
