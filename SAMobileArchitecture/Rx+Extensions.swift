//
//  Rx+Extensions.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

typealias ComposeTransformer<T,R> = (Observable<T>) -> Observable<R>

extension ObservableType {
    func compose<T>(_ transformer: ComposeTransformer<E, T>) -> Observable<T> {
        return transformer(self.asObservable())
    }
}
