//
//  RestaurantCardView.swift
//  Romato
//
//  Created by Navati Jain on 2020-11-26.
//

import UIKit

class RestaurantCardView: UIView {
    
    var model: RestaurantModel? {
        didSet{
            if let restaurant = model?.restaurant {
                restaurantTitle.text = restaurant.name
                cuisines.text = restaurant.cuisines
                if let pricing = restaurant.averageCostForTwo {
                    pricingLabel.text = "\(pricing)\(LocalizedString.RestaurantDetails.pricingForTwo)"
                } else {
                    pricingLabel.text = LocalizedString.notAvailableShort
                }
                addressLabel.text = restaurant.location?.localityVerbose ?? LocalizedString.notAvailableLong
               // print("IMAGE:\(restaurant.thumb)")
                if let restaurantImageLink = restaurant.thumb, let URL = URL(string: restaurantImageLink) {
                    imageView.loadURL(url: URL)
                }
                layoutIfNeeded() //TO DO: why
            }
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var distancelabel: UILabel = {
        let label = UILabel()
        //TODO: Distance calc
        label.text = "5.2 km"
        label.font = Fonts.ofSize(.extraSmall, .regular)
        label.textColor = Colors.Brand.gray200
        return label
    }()
    
    lazy var labelBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Brand.white
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var bookmarkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: LocalizedString.Files.bookMarkImage)
        return imageView
    }()
    
    lazy var circleBackground: UIView = {
        let view = UIView()
        view.backgroundColor =  Colors.Brand.white
        view.layer.cornerRadius = 12.5
        return view
    }()
    
    lazy var imageCard = UIView()
    
    func setupImageCard() {
        imageCard.addSubviewsWithAutoLayout([imageView,labelBackground,circleBackground])
        circleBackground.addSubviewsWithAutoLayout(bookmarkImage)
        labelBackground.addSubviewsWithAutoLayout(distancelabel)
        //self
        var constraints = imageView.anchor(to: imageCard)
      //  var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 3/2),
//            imageView.topAnchor.constraint(equalTo: imageCard.topAnchor),
//            imageView.bottomAnchor.constraint(equalTo: imageCard.bottomAnchor),
//            imageView.leadingAnchor.constraint(equalTo: imageCard.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: imageCard.trailingAnchor),
            circleBackground.topAnchor.constraint(equalTo: imageCard.topAnchor, constant: 12),
            circleBackground.trailingAnchor.constraint(equalTo: imageCard.trailingAnchor, constant: -12),
            circleBackground.widthAnchor.constraint(equalToConstant: 25),
            circleBackground.heightAnchor.constraint(equalToConstant: 25),
            bookmarkImage.centerXAnchor.constraint(equalTo: circleBackground.centerXAnchor),
            bookmarkImage.centerYAnchor.constraint(equalTo: circleBackground.centerYAnchor),
            bookmarkImage.widthAnchor.constraint(equalToConstant: 12),
            bookmarkImage.heightAnchor.constraint(equalToConstant: 12),
            labelBackground.trailingAnchor.constraint(equalTo: circleBackground.trailingAnchor),
            labelBackground.bottomAnchor.constraint(equalTo: imageCard.bottomAnchor, constant: -12),
            labelBackground.heightAnchor.constraint(equalTo: distancelabel.heightAnchor, constant: 8),
            labelBackground.widthAnchor.constraint(equalTo: distancelabel.widthAnchor, constant: 25),
            distancelabel.centerXAnchor.constraint(equalTo: labelBackground.centerXAnchor),
            distancelabel.centerYAnchor.constraint(equalTo: labelBackground.centerYAnchor),
        ])
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: Restaurant Summary Card
    
    lazy var restaurantTitle: UILabel = {
        let restaurantName = UILabel()
        restaurantName.font = Fonts.ofSize(.large, .semiBold)
        restaurantName.numberOfLines = 0
        restaurantName.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return restaurantName
    }()
    
    lazy var ratingView: RatingView = {
        let ratingView = RatingView()
        ratingView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return ratingView
    }()
    
    lazy var titleAndRatingsView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [restaurantTitle,ratingView])
        stackView.spacing = 50
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()
    
    lazy var cuisines: UILabel = {
        let label = UILabel()
        label.font = Fonts.ofSize(.medium, .regular)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var pricingLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.ofSize(.medium, .regular)
        label.textColor = Colors.Brand.gray200
        label.numberOfLines = 1
        label.textAlignment = .right //
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    lazy var categoryAndPricingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cuisines,pricingLabel])
        stackView.spacing = 50
        stackView.axis = .horizontal
        stackView.distribution = .fill //
        stackView.alignment = .top
        return stackView
        
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.ofSize(.small, .regular)
        label.textColor = Colors.Brand.gray200
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var restaurantSummaryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleAndRatingsView,categoryAndPricingStackView,addressLabel])
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var restaurantSummaryCard = UIView()
    //MARK: Functions
    
    private func setupRestaurantSummary(){
        restaurantSummaryCard.addSubviewsWithAutoLayout([restaurantSummaryStackView])
        let constraints = [
            restaurantSummaryStackView.topAnchor.constraint(equalTo: restaurantSummaryCard.topAnchor, constant: 10),
            restaurantSummaryStackView.leadingAnchor.constraint(equalTo: restaurantSummaryCard.leadingAnchor, constant: 20),
            restaurantSummaryStackView.trailingAnchor.constraint(equalTo: restaurantSummaryCard.trailingAnchor, constant: -20),
            restaurantSummaryStackView.bottomAnchor.constraint(equalTo: restaurantSummaryCard.bottomAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: Constraints
    func setupView() {
        setupImageCard()
        setupRestaurantSummary()
        
        addSubviewsWithAutoLayout([imageCard,restaurantSummaryCard])
        
        let constraints = [
            imageCard.topAnchor.constraint(equalTo: topAnchor),
            imageCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCard.bottomAnchor.constraint(equalTo: restaurantSummaryCard.topAnchor),
            restaurantSummaryCard.leadingAnchor.constraint(equalTo: imageCard.leadingAnchor),
            restaurantSummaryCard.trailingAnchor.constraint(equalTo: imageCard.trailingAnchor),
            restaurantSummaryCard.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setBorder(){
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.gray.cgColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView {
    func loadURL(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
