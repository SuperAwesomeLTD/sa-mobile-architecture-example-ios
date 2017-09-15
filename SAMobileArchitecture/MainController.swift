//
//  MainController.swift
//  SAMobileArchitecture
//
//  Created by Gabriel Coman on 08/09/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

import UIKit
import RxSwift

class MainController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var store: Store<AppState>?
    
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let del = UIApplication.shared.delegate as! AppDelegate
        store = del.store
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        store?.addListener(self)
        store?.dispatch(SetupMainController())
        store?.dispatch(loadDataFromBackEndAction)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        store?.removeListener(self)
    }
}

extension MainController: HandlesStateUpdates {
    
    func handle(_ state: State) {
        
        print("Main state \(state)")
        
        if let state = state as? AppState {
            
            let mState = state.mainState
            
            switch mState {
            case .initial:
                table.dataSource = viewModel
                table.delegate = viewModel
                // 
                break
            case .isLoading:
                //
                break
            case .hasData(let data):
                print("RELOADING DATA")
                viewModel.update(data)
                table.reloadData()
                //
                break
            case .changeData:
                //
                break
            case .error:
                break
            }
        }
    }
}
