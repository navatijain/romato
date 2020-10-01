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
    
    /* not functioning
     var searchBar: UISearchController {
     let search = UISearchController(searchResultsController: nil)
     search.searchResultsUpdater = self
     search.obscuresBackgroundDuringPresentation = false
     search.searchBar.placeholder = "Type something here to search"
     navigationItem.searchController = search
     return search
     }
     */
    
    var filterViewScrollView = FilterContainerScrollView()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(FilterCell.self, forCellReuseIdentifier: "FilterCell")
        tableView.register(CollectionsHeaderCell.self, forCellReuseIdentifier: "CollectionHeader")
        tableView.register(RestaurantCardCell.self, forCellReuseIdentifier: "RestaurantCard")
        tableView.tableHeaderView = filterViewScrollView
        tableView.tableHeaderView?.backgroundColor = .yellow
        return tableView
    }()
    
    func setTableHeaderView() {
        //    tableView.tableHeaderView = filterViewScrollView
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
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
                //   self.view.addSubviewsWithAutoLayout([self.tableView, self.addressView, self.filterViewScrollView])
                self.view.addSubviewsWithAutoLayout([self.tableView, self.addressView])
                self.setupConstraints()
                
            case .error:
                print("ERROR")
            //some other error view
            }
        }
    }
    
    private func setupConstraints() {
        //    filterViewScrollView.backgroundColor = .purple
        
        let constraints = [
            addressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            addressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            addressView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -10),
            
            filterViewScrollView.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor),
            filterViewScrollView.widthAnchor.constraint(equalTo: self.tableView.widthAnchor),
            filterViewScrollView.topAnchor.constraint(equalTo: self.tableView.topAnchor),
            //   addressView.bottomAnchor.constraint(equalTo: filterViewScrollView.topAnchor, constant: -10),
            
            //            filterViewScrollView.leadingAnchor.constraint(equalTo: addressView.leadingAnchor),
            //            filterViewScrollView.trailingAnchor.constraint(equalTo: addressView.trailingAnchor),
            //            filterViewScrollView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -10),
            //            filterViewScrollView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            //            tableView.leadingAnchor.constraint(equalTo: filterViewScrollView.leadingAnchor),
            //            tableView.trailingAnchor.constraint(equalTo: filterViewScrollView.trailingAnchor),
            //            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
          // filterViewScrollView.heightAnchor.constraint(equalToConstant: 60),
            
            tableView.leadingAnchor.constraint(equalTo: addressView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: addressView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            //  filterViewScrollView.widthAnchor.constraint(equalTo: tableView.widthAnchor)
            // filterViewScrollView.anchor(to: tableView.tableHeaderView)
            
        ]

        NSLayoutConstraint.activate(constraints)
        
        //        self.tableView.tableHeaderView?.layoutIfNeeded()
        //        self.tableView.tableHeaderView = self.tableView.tableHeaderView
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    //https://jayeshkawli.ghost.io/add-header-footer-view-tableview/
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateHeaderViewHeight(for: tableView.tableHeaderView)
    }

    func updateHeaderViewHeight(for header: UIView?) {
        guard let header = header else { return }
        header.frame.size.height = header.systemLayoutSizeFitting(CGSize(width: view.bounds.width - 32.0, height: 0)).height
    }
    
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
        //            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell") as? FilterCell else {
        //                return UITableViewCell()
        //            }
        //            return cell
        
        case .collectionsHeader:
            print("collection header")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionHeader") as? CollectionsHeaderCell else {
                return UITableViewCell()
            }
            return cell
            
        case .collectionsScroll:
            print("collections scroll")
            
        case .restaurantCard:
            print("restaurant card")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCard") as? RestaurantCardCell else {
                return UITableViewCell()
                
            }
            
            return cell
            
        }
        return UITableViewCell()
    }
}

/* Not functioning
 extension HomeViewController: UISearchResultsUpdating {
 
 func updateSearchResults(for searchController: UISearchController) {
 guard let text = searchController.searchBar.text else { return }
 print(text)
 }
 }
 */
