//
//  MainDataSource.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class MainDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var data: [BackendModel] = []
    
    func update(_ data: [BackendModel]) {
        self.data = data
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return data[section].header.title
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.Identifier, for: indexPath) as! ItemCell
        return cell
        
//        switch model {
//        case .big(let bigModel):
//            let cell = tableView.dequeueReusableCell(withIdentifier: BigCell.Identifier, for: indexPath) as! BigCell
//            cell.viewModel = BigCellViewModel(withModel: bigModel)
//            return cell
//        case .small(let smallModel):
//            let cell = tableView.dequeueReusableCell(withIdentifier: SmallCell.Identifier, for: indexPath) as! SmallCell
//            cell.viewModel = SmallCellViewModel(withModel: smallModel)
//            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
