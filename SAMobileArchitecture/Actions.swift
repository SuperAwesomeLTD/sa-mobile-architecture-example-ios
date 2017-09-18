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
            return LoadBackendDataEvent(data: elements, isLoading: false, hasError: false)
        }
        .catchErrorJustReturn(LoadBackendDataEvent(data: [], isLoading: false, hasError: true))
        .startWith(LoadBackendDataEvent(data: [], isLoading: true, hasError: false))
}

func toggleFavouriteItem (forModel model: BackendModel) -> Observable<Event> {
    return Observable.just(ItemCellFavEvent(model: model))
}

func toggleLikeItem (forModel model: BackendModel) -> Observable<Event> {
    return Observable.just(ItemCellLikeEvent(model: model))
}
