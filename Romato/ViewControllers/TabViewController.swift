//
//  TabViewController.swift
//  Romato
//
//  Created by Navati Jain on 2020-12-10.
//

import UIKit

class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = HomeViewController(model: HomeViewModel())
        homeVC.tabBarItem = UITabBarItem(title: "Main", image: nil, selectedImage: nil)
        viewControllers = [homeVC]
        
    }
}
