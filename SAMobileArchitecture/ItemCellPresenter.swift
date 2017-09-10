//
//  ItemCellPresenter.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

class ItemCellPresenter {

    var likeTransformer: ComposeTransformer<ItemCellEvent, ItemCellResult> {
        return { observable -> Observable<ItemCellResult> in
            return observable
                .map{ event -> BackendModel in
                    return event.model
                }
                .do(onNext: { model in
                    model.isLiked = !model.isLiked
                })
                .map { model -> ItemCellResult in
                    return ItemCellResult.changed(model: model)
                }
        }
    }
    
    var favTransformer: ComposeTransformer<ItemCellEvent, ItemCellResult> {
        return { observable -> Observable<ItemCellResult> in
            return observable
                .map{ event -> BackendModel in
                    return event.model
                }
                .do(onNext: { model in
                    model.isFavourite = !model.isFavourite
                })
                .map { model -> ItemCellResult in
                    return ItemCellResult.changed(model: model)
                }
        }
    }
    
    var transformer: ComposeTransformer<ItemCellEvent, ItemCellResult> {
        return { observable -> Observable<ItemCellResult> in
            return Observable.merge([
                    observable.filter { $0 is ItemCellLikeEvent }.compose(self.likeTransformer),
                    observable.filter { $0 is ItemCellFavEvent }.compose(self.favTransformer)
                ])
        }
    }
    
    /*override*/ var initialState: ItemCellState {
        return ItemCellState.initial
    }
    
    func observe(stateForEvents events: Observable<ItemCellEvent>) -> Observable<ItemCellState> {
        return events
            .compose(transformer)
            .scan(initialState, accumulator: reducer)
            .startWith(initialState)
    }
    
    func reducer(_ previous: ItemCellState, _ result: ItemCellResult) -> ItemCellState {
        switch result {
        case .changed(_):
            return ItemCellState.changed
        }
    }
}
