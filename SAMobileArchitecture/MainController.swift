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
        
        store = Store<MainState>(state: MainState.initial, reducer: reducer)
        store.listen(forNewState: handle)
        
        store.dispatch(loadDataFromBackEndAction)
    }
    
    func loadDataFromBackEndAction () -> Observable<Event> {
        return BackendTask().execute(input: "")
            .toArray()
            .map { elements -> LoadBackendDataEvent in
                return LoadBackendDataEvent(data: elements, isLoading: false)
            }
            .catchErrorJustReturn(LoadBackendDataEvent(data: nil, isLoading: false))
            .startWith(LoadBackendDataEvent(data: nil, isLoading: true))
    }
    
    func reducer(_ previous: MainState, _ event: Event) -> MainState {
        
        if let event = event as? LoadBackendDataEvent {
            
            if let data = event.data {
                return MainState.success(data: data)
            } else if event.isLoading {
                return MainState.loading
            } else {
                return MainState.error
            }
            
        } else {
            return previous
        }
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
