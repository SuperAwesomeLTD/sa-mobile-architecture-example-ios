//
//  ViewController.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit

class IntroController: UIViewController {

    var store: Store<AppState>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let del = UIApplication.shared.delegate as! AppDelegate
        store = del.store
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        store?.addListener(self)
        store?.dispatch(SkipIntroEvent())
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        store?.removeListener(self)
    }
}

extension IntroController: HandlesStateUpdates {
    
    func handle(_ state: State) {
        
        print("Intro state \(state)")
        
        if let state = state as? AppState {
            let introState = state.introState
            
            if introState.shouldAdvance {
                self.performSegue(withIdentifier: "IntroToMain", sender: self)
            }
        }
    }
}
