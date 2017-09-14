//
//  Actions.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 14/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

func loadDataFromBackEndAction () -> Observable<Event> {
    return BackendTask().execute(input: "")
        .toArray()
        .map { elements -> LoadBackendDataEvent in
            return LoadBackendDataEvent(data: elements, isLoading: false)
        }
        .catchErrorJustReturn(LoadBackendDataEvent(data: nil, isLoading: false))
        .startWith(LoadBackendDataEvent(data: nil, isLoading: true))
}
