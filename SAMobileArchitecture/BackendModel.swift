//
//  BackendModel.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class BackendModel {
    var bgColor: UIColor
    var text: String
    var isFavourite: Bool
    var isLiked: Bool
    
    init(bgColor: UIColor, text: String, isFavourite: Bool, isLiked: Bool) {
        self.bgColor = bgColor
        self.text = text
        self.isFavourite = isFavourite
        self.isLiked = isLiked
    }
}
