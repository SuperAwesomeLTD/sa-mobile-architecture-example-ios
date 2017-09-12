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
    
    var store: Store<MainState>!
    
    let bag = DisposeBag()
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store = Store<MainState>(state: MainState.initial, reducer: mainReducer)
        store.listen(forNewState: handle)
        
        store.dispatch(loadDataFromBackEndAction)
    }
    
    func handle(state st: MainState) {
        print("Main state :: \(st)")
        switch st {
        case .initial:
            table.dataSource = viewModel
            table.delegate = viewModel
            break
        case .loading:
            break
        case .success(let data):
            viewModel.update(data)
            break
        case .error:
            break
        }
    }
}
