//
//  FavouriteCellViewModel.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 18/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class FavouriteCellViewModel {

    var model: BackendModel
    
    var cellTitle: String {
        return model.text
    }
    
    init(model: BackendModel) {
        self.model = model
    }
    
}
