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
    
    var store: Store<AppState>?
    
    var viewModel: ItemCellViewModel! {
        didSet {
            icon.backgroundColor = viewModel.cellIcon
            name.text = viewModel.cellTitle
            like.backgroundColor = viewModel.likeBgColor
            add.backgroundColor = viewModel.favBgColor
            
            let del = UIApplication.shared.delegate as! AppDelegate
            store = del.store
            store?.addListener(self)
        }
    }
    
    override func prepareForReuse() {
        store?.removeListener(self)
    }
    
    @IBAction func likeAction(_ sender: Any) {
        store?.dispatch({ () -> Observable<Event> in
            return toggleLikeItem(forModel: self.viewModel.model)
        })
    }
    
    @IBAction func addAction(_ sender: Any) {
        store?.dispatch({ () -> Observable<Event> in
            return toggleFavouriteItem(forModel: self.viewModel.model)
        })
    }
}

extension ItemCell: HandlesStateUpdates {
    func handle(_ state: State) {
        print("Item cell state is \(state)")
        like.backgroundColor = viewModel.likeBgColor
        add.backgroundColor = viewModel.favBgColor
    }
}
