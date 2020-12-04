//
//  HomeViewModel.swift
//  Romato
//
//  Created by Navati Jain on 2020-08-21.
//

import Foundation

enum CellType{
    case filterRow, blankSpace, collectionsHeader, collectionsScroll, restaurantCard(RestaurantModel)
}

class HomeViewModel {
    
    enum State {
        case notLoaded, loading, loaded, error
    }
    
    var dataSource : [CellType] = [.collectionsHeader, .blankSpace,.collectionsScroll, .blankSpace,]
    
    private func addRestaurantCard(model: LocationDetails) {
        if let restaurantList = model.bestRatedRestaurant {
            for restaurant in restaurantList {
                dataSource.append(CellType.restaurantCard(restaurant)) }
        }
    }
    
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
        LocationDetailsService.getLocationDetails { (result) in
            DispatchQueue.main.async {
                switch(result) {
                case .success(let result):
                    print(result)
                    self.addRestaurantCard(model: result)
                    self.state = .loaded
                case .failure(let error):
                    print(error)
                }
            }
        }
        //state = .loaded
        //load tableview
        
        
    }
}
