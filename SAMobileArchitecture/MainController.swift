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
    
    let bag = DisposeBag()
    let viewModel = MainViewModel()
    let presenter = MainPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uiEvents: Observable<Event> = Observable.just(BackendEvent())
        
        presenter.observe(stateForEvents: uiEvents)
            .subscribe(onNext: handle)
            .addDisposableTo(bag)
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
