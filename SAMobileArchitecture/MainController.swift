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
    let dataSource = MainDataSource()
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
            table.dataSource = dataSource
            table.delegate = dataSource
            break
        case .loading:
            break
        case .success(let data):
            dataSource.update(data)
            break
        case .error:
            break
        }
    }
}
