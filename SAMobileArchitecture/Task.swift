//
//  Task.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

class Task <Input, Output> {
    
    func execute(input: Input) -> Observable<Output> {
        return Observable.empty()
    }
}
