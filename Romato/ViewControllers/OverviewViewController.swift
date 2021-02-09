//
//  OverviewViewController.swift
//  Romato
//
//  Created by Navati Jain on 2020-12-13.
//

import UIKit

class OverviewViewController: UIViewController {
    
    var restaurantId: String
    
    let viewModel = OverviewViewModel()
    //MARK: UI Elements
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "food")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private var starImageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return imageView
    }
    
    private lazy var starImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.ofSize(14, .semiBold)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var reviewLinkLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.ofSize(12, .extraLight)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reviewsClicked)))
        return label
    }()
    
    @objc func reviewsClicked(){
        print("reviews")
    }
    
    private lazy var firstStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starImageStackView, ratingLabel, reviewLinkLabel])
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return stackView
    }()
    
    private lazy var restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Fonts.ofSize(18, .bold)
        return label
    }()
    
    private lazy var cuisineLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.ofSize(16, .regular)
        return label
    }()
    
    private lazy var localityLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.ofSize(16, .regular)
        label.textColor = Colors.Brand.gray200
        return label
    }()
    
    private lazy var restaurantDetailsView: UIView = {
        let restaurantView = UIView()
        restaurantView.backgroundColor = .white
        return restaurantView
    }()
    
    private lazy var timingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Open now - 11:30 am - 10pm (Today)"
        label.font = Fonts.ofSize(16, .regular)
        label.textColor = Colors.Brand.gray500
        return label
    }()
    
    private lazy var costLabel: UILabel = {
        let label = UILabel()
        label.text = "Cost for two = $50"
        label.font = Fonts.ofSize(16, .regular)
        label.textColor = Colors.Brand.gray200
        return label
    }()
    
    private lazy var phoneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "phone")
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return imageView
    }()
    
    
    private func setup(){
        view.backgroundColor = .gray
        view.addSubviewsWithAutoLayout([imageView, restaurantDetailsView])
        restaurantDetailsView.addSubviewsWithAutoLayout([firstStackView, restaurantNameLabel, cuisineLabel, localityLabel, timingsLabel,costLabel,phoneImage])
        var constraints = [
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            restaurantDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            restaurantDetailsView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            restaurantDetailsView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ]
        let spacing = CGFloat(3)
        let restaurantViewConstraints = [
            firstStackView.topAnchor.constraint(equalTo: restaurantDetailsView.topAnchor, constant: 15),
            firstStackView.leadingAnchor.constraint(equalTo: restaurantDetailsView.leadingAnchor, constant: 10),
            firstStackView.trailingAnchor.constraint(equalTo: restaurantDetailsView.trailingAnchor, constant: -10),
            restaurantNameLabel.topAnchor.constraint(equalTo: firstStackView.bottomAnchor,constant: spacing),
            restaurantNameLabel.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor),
            restaurantNameLabel.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor),
            cuisineLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor,constant: spacing),
            cuisineLabel.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor),
            cuisineLabel.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor),
            localityLabel.topAnchor.constraint(equalTo: cuisineLabel.bottomAnchor,constant: spacing),
            localityLabel.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor),
            localityLabel.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor),
            timingsLabel.topAnchor.constraint(equalTo: localityLabel.bottomAnchor, constant: spacing),
            timingsLabel.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor),
            timingsLabel.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor),
            costLabel.topAnchor.constraint(equalTo: timingsLabel.bottomAnchor, constant: spacing),
            costLabel.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor),
            costLabel.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor),
            costLabel.bottomAnchor.constraint(equalTo: restaurantDetailsView.bottomAnchor, constant: -20),
            phoneImage.leadingAnchor.constraint(greaterThanOrEqualTo: costLabel.trailingAnchor, constant: 20),
            phoneImage.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor),
            phoneImage.bottomAnchor.constraint(equalTo: restaurantDetailsView.bottomAnchor, constant: -20),
        ]
        constraints.append(contentsOf: restaurantViewConstraints)
        NSLayoutConstraint.activate(constraints)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getRestaurantDetails(for: restaurantId)
        setHandlers()
    }
    
    private func setupView(model: Restaurant?) {
        if let restaurant = model {
            
            if let rating = restaurant.userRating?.aggregateRating,
               let ratingInteger = restaurant.userRating?.aggregateRatingInteger {
                ratingLabel.text = rating
                for _ in 0 ..< ratingInteger {
                    starImageStackView.addArrangedSubview(starImageView)
                }
            } else {
                ratingLabel.isHidden = true
            }
            
            if let reviewCount = restaurant.allReviewsCount {
                reviewLinkLabel.text =  "(\(reviewCount) reviews)"
            } else {
                reviewLinkLabel.text =  "No reviews available"
            }
            
            restaurantNameLabel.text = restaurant.name
            cuisineLabel.text = restaurant.cuisines
            localityLabel.text = restaurant.location?.locality
            if let cost = restaurant.averageCostForTwo {
                costLabel.text = "\(LocalizedString.Overview.costForTwo) - CA$ \(cost) \(LocalizedString.Overview.approxCost)"
            } else {
                costLabel.isHidden = true
            }
            
            if let phoneNumber = restaurant.phoneNumbers,
               let phoneURL = URL(string: "tel://\(phoneNumber)"),
               UIApplication.shared.canOpenURL(phoneURL) {
                phoneImage.isUserInteractionEnabled = true
            } else {
                phoneImage.isHidden = true
            }
        }
    }
    
    func setHandlers(){
        viewModel.stateChanged = {[weak self]  state in
            switch state {
            case .loading:
                print("loading")
            case .loaded(let model):
                print("loaded")
                self?.setupView(model: model)
                self?.setup()
            case .notLoaded:
                print("not loaded")
            case .error:
                print("error")
            }
        }
    }
    
    init(restaurantId: String) {
        self.restaurantId = restaurantId
        super.init(nibName: nil, bundle: nil)
        print( self.restaurantId )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
