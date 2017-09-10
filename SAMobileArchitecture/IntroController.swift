//
//  ViewController.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class IntroController: UIViewController {

    var store: Store<IntroState>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store = Store<IntroState>(state: IntroState.initial, reducer: reducer)
        store.listen(forNewState: handle)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        store.dispatch(NavigationEvent.goto(segue: "IntroToMain"))
    }
    
    private func reducer(_ previous: IntroState, _ event: Event) -> IntroState {
        if let event = event as? NavigationEvent {
            switch event {
            case .goto(let segue):
                return IntroState.goto(segue: segue)
            }
        } else {
            return previous
        }
    }
    
    private func handle(state st: IntroState) {
        print("Intro state :: \(st)")
        switch st {
        case .initial:
            break
        case .goto(let segue):
            self.performSegue(withIdentifier: segue, sender: segue)
            break
        }
    }
}

