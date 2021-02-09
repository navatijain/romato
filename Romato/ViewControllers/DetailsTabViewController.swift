//
//  DetailsTabViewController.swift
//  Romato
//
//  Created by Navati Jain on 2020-12-13.
//

import UIKit

class DetailsTabViewController: UITabBarController {
    var restaurantId: String
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let overviewVC = OverviewViewController(restaurantId: restaurantId)
        let reviewsVC = ReviewsViewController()
        
        overviewVC.tabBarItem = UITabBarItem(title: "Overview", image: nil, selectedImage: nil)
        reviewsVC.tabBarItem = UITabBarItem(title: "Reviews", image: nil, selectedImage: nil)
        
        viewControllers = [overviewVC,reviewsVC]
    }
    init(restaurantId: String) {
        self.restaurantId = restaurantId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
