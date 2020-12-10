//
//  FilterViewScrollView.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-20.
//

import UIKit

class FilterContainerScrollView: UIView {
    
    private var scrollView = ScrollViewWithContainerView()
    
    //move the initilaization of this variable outside later
    private var filterTextList: [String] = [
        LocalizedString.FilterComponent.nearestToMe,
        LocalizedString.FilterComponent.ratings,
        LocalizedString.FilterComponent.bookATable,
        LocalizedString.FilterComponent.cafe,
        LocalizedString.FilterComponent.openNow,
    ]
    
    private lazy var filterComponentsList: [FilterView] = {
        var filterComponentsList =  [FilterView]()

        filterTextList.forEach {
            let filterComponent = FilterView()
            filterComponent.labelText = $0
            filterComponentsList.append(filterComponent)
        }
        return filterComponentsList
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: filterComponentsList)
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var filterButton = FilterButton()
    
    private func setConstraints() {
        scrollView.containerView.addSubviewsWithAutoLayout(stackView)
        addSubviewsWithAutoLayout([filterButton,scrollView])
        var constraints = stackView.anchor(to: scrollView.containerView, with: UIEdgeInsets(top: 1, left: 5, bottom: -1, right: -5))
        constraints.append(contentsOf: [
            filterButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            filterButton.topAnchor.constraint(equalTo: self.topAnchor),
            filterButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            filterButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: -5),
            scrollView.topAnchor.constraint(equalTo: filterButton.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: filterButton.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
       // setup()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
