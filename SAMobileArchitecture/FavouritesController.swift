//
//  FavouritesController.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class FavouritesController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = FavouritesViewModel()
    
    var store: Store<AppState>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let del = UIApplication.shared.delegate as! AppDelegate
        store = del.store
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        store?.addListener(self)
        store?.dispatch(GetFavouritesEvent())
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        store?.removeListener(self)
    }
}

extension FavouritesController: HandlesStateUpdates {
    
    func handle(_ state: State) {
        
        if let state = state as? AppState {
            
            let mState = state.mainState
            
            tableView.dataSource = viewModel
            tableView.delegate = viewModel
            
            viewModel.update(mState.data.filter { model -> Bool in
                return model.isFavourite
            })
            tableView.reloadData()
        }
    }
}
