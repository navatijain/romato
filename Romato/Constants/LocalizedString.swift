//
//  LocalizedString.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-19.
//

import Foundation

struct LocalizedString {
    
    struct MainView {
        static let searchPlaceHolder = "Restaurant name, cuisine, or a dish..."
    }
    
    struct FilterComponent {
        static let filters = "Filters"
        static let nearestToMe = "Nearest To Me"
        static let ratings = "Rating 4.5+"
        static let bookATable = "Book a table"
        static let cafe = "Cafes"
        static let openNow = "Open Now"
    }
    
    static let collections = "Curated Collections"
    static let seeAll = "See All"
    
    struct RestaurantDetails {
        static let pricingForTwo = "$ for two"
    }
    
    static let notAvailableLong = "Not Available"
    static let notAvailableShort = "NA"
    
    struct Files {
        static let bookMarkImage = "bookmark"
    }
    
    struct Overview {
        static let review = "reviews"
        static let closesIn = "Closes in"
        static let open = "Open now"
        static let hour = "hour"
        static let hours = "hours"
        static let minute = "minute"
        static let minutes = "minutes"
        static let costForTwo = "Cost for two"
        static let approxCost = "(approx.) without alcohol"
    }
    
}
