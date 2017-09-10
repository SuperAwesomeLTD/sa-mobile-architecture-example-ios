//
//  MyCell.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ItemCell: UITableViewCell {

    static let Identifier = "ItemCellId"
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var like: UIButton!
    @IBOutlet weak var add: UIButton!
    
    var bag = DisposeBag()
    var disposable: Disposable!
    var presenter = ItemCellPresenter()
    
    var viewModel: ItemCellViewModel! {
        didSet {
            icon.backgroundColor = viewModel.cellIcon
            name.text = viewModel.cellTitle
            like.backgroundColor = viewModel.likeBgColor
            add.backgroundColor = viewModel.favBgColor
            
            let likeEvents: Observable<ItemCellEvent> = like.rx.tap.asObservable().map { res -> ItemCellLikeEvent in
                return ItemCellLikeEvent(self.viewModel.model)
            }
            let addEvents: Observable<ItemCellEvent> = add.rx.tap.asObservable().map { res -> ItemCellFavEvent in
                return ItemCellFavEvent(self.viewModel.model)
            }
            let uiEvents = Observable.merge([likeEvents, addEvents])
            
            disposable = presenter.observe(stateForEvents: uiEvents).subscribe(onNext: self.handle)
            disposable.addDisposableTo(bag)
        }
    }
    
    override func prepareForReuse() {
        disposable.dispose()
    }
    
    func handle(state st: ItemCellState) {
        switch st {
        case .initial, .changed:
            like.backgroundColor = viewModel.likeBgColor
            add.backgroundColor = viewModel.favBgColor
            break
        }
    }
}
