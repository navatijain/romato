//
//  HomeViewController.swift
//  Romato
//
//  Created by Navati Jain on 2020-08-21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel
 
    required init(model: HomeViewModel) {
        viewModel = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     var addressView =  AddressView()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .green
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        setupHandlers()
        viewModel.loadMainData()
    }
    
    private func setupHandlers() {
        viewModel.stateChangeHandler = { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .notLoaded:
                print("not loaded")
            //spinner
                
            case .loading:
                print("loading")
                
            case .loaded:
                print("loaded")
               // self.view.addSubview(self.tableView.autolayout()) // add autolayour
                self.view.addSubviewsWithAutoLayout([self.tableView, self.addressView])
                self.setupConstraints()
            case .error:
                print("ERROR")
            //some other error view
            }
        }
    }
    
    private func setupConstraints() {
        let constraints = [
            addressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            addressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            addressView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: 10),
            
            tableView.leadingAnchor.constraint(equalTo: addressView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: addressView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = viewModel.dataSource[indexPath.row]
        
        switch row {
        case .blankSpace:
            print("blank space")
            
        case .filterRow:
            print("filter row")

        case .collectionsHeader:
            print("collections header")

        case .collectionsScroll:
            print("collections scroll")

        case .restaurantCard:
            print("restaurant card")
        }
        
        return UITableViewCell()
    }
}

