//
//  FavouritesViewModel.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 18/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class FavouritesViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {

    var data: [FavouriteCellViewModel] = []
    
    func update(_ data: [BackendModel]) {
        self.data = data.map { model -> FavouriteCellViewModel in
            return FavouriteCellViewModel(model: model)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteCell.Identifier, for: indexPath) as! FavouriteCell
        cell.viewModel = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //
        // if editing mode is .delete
        if editingStyle == .delete {
            //
            // get model
            let model = data[indexPath.row].model
            
            //
            // get store
            let del = UIApplication.shared.delegate as! AppDelegate
            
            //
            // dispatch event
            del.store.dispatch(DeleteFavouriteEvent(model: model))
        }
    }
}
