//
//  BackendTask.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

class BackendTask: Task <String, BackendModel> {

    override func execute(input: String) -> Observable<BackendModel> {
        return Observable.create{ subscriber -> Disposable in
         
            let data: [BackendModel] = [
                BackendModel(bgColor: UIColor.red, text: "My model 1", isFavourite: false, isLiked: false),
                BackendModel(bgColor: UIColor.gray, text: "My model 2", isFavourite: false, isLiked: false),
                BackendModel(bgColor: UIColor.yellow, text: "My model 3", isFavourite: false, isLiked: false),
                BackendModel(bgColor: UIColor.magenta, text: "My model 4", isFavourite: false, isLiked: false),
                BackendModel(bgColor: UIColor.blue, text: "My model 5", isFavourite: false, isLiked: false),
                BackendModel(bgColor: UIColor.brown, text: "My model 6", isFavourite: false, isLiked: false),
                BackendModel(bgColor: UIColor.darkGray, text: "My model 7", isFavourite: false, isLiked: false),
                BackendModel(bgColor: UIColor.cyan, text: "My model 8", isFavourite: false, isLiked: false)
            ]
            
            data.forEach { model in
                subscriber.onNext(model)
            }
            subscriber.onCompleted()
            
            return Disposables.create()
        }
    }
    
}
