//
//  FilterViewScrollView.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-20.
//

import UIKit

class FilterViewScrollView: UIView {
    
    var scrollView = ScrollViewWithContainerView()
    
    //move the initilaization of this variable outside later
    var filterTextList: [String] = [
        LocalizedString.FilterComponent.filters,
        LocalizedString.FilterComponent.nearestToMe,
        LocalizedString.FilterComponent.ratings,
        LocalizedString.FilterComponent.bookATable,
        LocalizedString.FilterComponent.cafe,
        LocalizedString.FilterComponent.openNow,
    ]
    
    lazy var filterComponentsList: [FilterViewComponent] = {
        var filterComponentsList =  [FilterViewComponent]()
        
        filterTextList.forEach {
            let filterComponent = FilterViewComponent()
            filterComponent.labelText = $0
            filterComponentsList.append(filterComponent)
        }
        return filterComponentsList
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: filterComponentsList)
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    func setup() {
        setBorder()
        
    }
    
    func setBorder() {
        layer.borderWidth = 1
        layer.borderColor =  Colors.Brand.gray100.cgColor
    }
    
    func setConstraints() {
        scrollView.backgroundColor = .red
        scrollView.containerView.addSubviewsWithAutoLayout(stackView)
        //        addSubviewsWithAutoLayout([stackView])
        //        let constraints = stackView.anchor(to: self, with: UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5))
        addSubviewsWithAutoLayout(scrollView)
        var constraints = stackView.anchor(to: scrollView.containerView, with: UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5))
        constraints.append(contentsOf: scrollView.anchor(to: self))
        NSLayoutConstraint.activate(constraints)
    }
    
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
