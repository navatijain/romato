//
//  RestaurantHomeViewModel.swift
//  Romato
//
//  Created by Navati Jain on 2020-12-15.
//

import Foundation


class OverviewViewModel {
    enum State {
        case loaded(model: Restaurant), loading, notLoaded, error
    }
    
    var state: State = .notLoaded {
        didSet {
            stateChanged?(state)
        }
    }
    
    var stateChanged: ((State) -> ())?
   
    func getRestaurantDetails(for restaurantId: String) {
        state = .loading
        LocationDetailsService.getRestaurantDetails(for: restaurantId) { (result) in
            DispatchQueue.main.async {
                switch(result) {
                case .success(let model):
                    self.state = .loaded(model: model)
                case .failure(let error):
                    self.state = .error
                }
            }
        }
    }
}
