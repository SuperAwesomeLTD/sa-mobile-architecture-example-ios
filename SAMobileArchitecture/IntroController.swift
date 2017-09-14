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
        
        let del = UIApplication.shared.delegate as! AppDelegate
        del.store.addListener(handle2)
        
//        
//        store = Store<IntroState>(state: IntroState.initial, reducer: reducer)
//        store.listen(forNewState: handle)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        store.dispatch(NavigationEvent(segue: "IntroToMain"))
    }
    
    private func reducer(_ previous: IntroState, _ event: Event) -> IntroState {
        if let event = event as? NavigationEvent {
            return IntroState.goto(segue: event.segue)
        } else {
            return previous
        }
    }
    
    private func handle2(newState state: AppState) {
        
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

extension IntroController: HandlesStateUpdates {
    
    func handle(_ state: State) {
        
    }
}
