//
//  ViewController.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

class IntroController: UIViewController {

    let bag = DisposeBag()
    let presenter = IntroPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uiEvents: Observable<NavigationEvent> = Observable.just(NavigationEvent(segue: "IntroToMain"))
        
        presenter.observe(stateForEvents: uiEvents)
            .subscribe(onNext: handle)
            .addDisposableTo(bag)
    }
    
    private func handle(state st: IntroState) {
        switch st {
        case .initial:
            break
        case .goto(let segue):
            self.performSegue(withIdentifier: segue, sender: segue)
            break
        }
    }
}

