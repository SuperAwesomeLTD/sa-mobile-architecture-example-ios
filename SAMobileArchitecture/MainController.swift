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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    
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
        store?.dispatch (loadDataFromBackEndAction)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        store?.removeListener(self)
    }
}

extension MainController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        store?.dispatch(SearchLocallyInDataEvent(searchfilter: searchText))
    }
}

extension MainController: HandlesStateUpdates {
    
    func handle(_ state: State) {
        
        print("Main state ::\n\t\(state)")
        
        if let state = state as? AppState {
            
            let mState = state.mainState
            
            table.dataSource = viewModel
            table.delegate = viewModel
            
            if mState.hasData && !mState.isChanged {
                print("Update data!")
                viewModel.update(mState.data)
                table.reloadData()
            }
            
            if mState.hasError {
                print("HAS ERROR")
            }
            
            if mState.isLoading {
                spinner.startAnimating()
            } else {
                spinner.stopAnimating()
            }
            
        }
    }
}
