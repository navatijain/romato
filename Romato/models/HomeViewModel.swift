//
//  HomeViewModel.swift
//  Romato
//
//  Created by Navati Jain on 2020-08-21.
//

import Foundation

enum CellType{
    case filterRow, blankSpace, collectionsHeader, collectionsScroll, restaurantCard
}

class HomeViewModel {
    
    enum State {
        case notLoaded, loading, loaded, error
    }
    
    var dataSource : [CellType] = [.collectionsHeader, .blankSpace,.collectionsScroll, .blankSpace, .restaurantCard,.restaurantCard,.restaurantCard,.restaurantCard]
    
    private var state: State = .notLoaded {
        didSet {
            stateChangeHandler?(state)
        }
    }
    
    // closure
    var stateChangeHandler: ( (State) -> Void )?
    
    func loadMainData() {
        // some network call
        state = .loading
        
        // actual network call will be starting from here/
        
        //state = .loaded
        //load tableview
        state = .loaded
        
    }
}
