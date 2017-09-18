//
//  FavouriteCell.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class FavouriteCell: UITableViewCell {

    static let Identifier = "FavouriteCellId"
    
    @IBOutlet weak var favouritesName: UILabel!
    
    var viewModel: FavouriteCellViewModel! {
        didSet {
            favouritesName.text = viewModel.cellTitle
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
