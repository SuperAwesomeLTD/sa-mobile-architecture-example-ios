//
//  MainDataSource.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class MainViewModel: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var data: [ItemCellViewModel] = []
    
    func update(_ data: [BackendModel]) {
        self.data = data.map { model -> ItemCellViewModel in
            return ItemCellViewModel(model: model)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.Identifier, for: indexPath) as! ItemCell
        cell.viewModel = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
