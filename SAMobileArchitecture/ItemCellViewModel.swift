//
//  ItemCellViewModel.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class ItemCellViewModel {
    
    var model: BackendModel
    
    var cellTitle: String {
        return model.text
    }
    
    var cellIcon: UIColor {
        return model.bgColor
    }
    
    var likeBgColor: UIColor {
        return model.isLiked ? UIColor.green : UIColor.clear
    }
    
    var favBgColor: UIColor {
        return model.isFavourite ? UIColor.green: UIColor.clear
    }
    
    init(model: BackendModel) {
        self.model = model
    }
}
