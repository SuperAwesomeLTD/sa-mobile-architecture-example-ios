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
    
    var store: Store<ItemCellState>?
    
    var viewModel: ItemCellViewModel! {
        didSet {
            icon.backgroundColor = viewModel.cellIcon
            name.text = viewModel.cellTitle
            like.backgroundColor = viewModel.likeBgColor
            add.backgroundColor = viewModel.favBgColor
            
            store = Store<ItemCellState>(state: ItemCellState.initial, reducer: reducer)
            store?.listen(forNewState: handle)
        }
    }
    
    override func prepareForReuse() {
        store = nil
    }
    
    func reducer(_ previous: ItemCellState, _ event: Event) -> ItemCellState {
        if event is ItemCellEvent {
            return ItemCellState.changed
        } else {
            return previous
        }
    }
    
    func handle(state st: ItemCellState) {
        switch st {
        case .initial, .changed:
            like.backgroundColor = viewModel.likeBgColor
            add.backgroundColor = viewModel.favBgColor
            break
        }
    }
    
    @IBAction func likeAction(_ sender: Any) {
        viewModel.model.isLiked = !viewModel.model.isLiked
        store?.dispatch(ItemCellEvent.changed(model: viewModel.model))
    }
    
    @IBAction func addAction(_ sender: Any) {
        viewModel.model.isFavourite = !viewModel.model.isFavourite
        store?.dispatch(ItemCellEvent.changed(model: viewModel.model))
    }
}
