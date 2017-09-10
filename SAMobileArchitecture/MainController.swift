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
        
        let task = BackendTask()
        task.execute(input: "")
            .toArray()
            .map { elements -> BackendEvent in
                return BackendEvent.success(data: elements)
            }
            .catchErrorJustReturn(BackendEvent.error)
            .startWith(BackendEvent.loading)
            .subscribe(onNext: { event in
                self.store.dispatch(event)
            })
            .addDisposableTo(bag)
    }
    
    func reducer(_ previous: MainState, _ event: Event) -> MainState {
        if let event = event as? BackendEvent {
            switch event {
            case .loading:
                return MainState.loading
            case .success(let data):
                return MainState.success(data: data)
            case .error:
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
