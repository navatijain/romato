//
//  LocationDetails.swift
//  Romato
//
//  Created by Navati Jain on 2020-11-28.
//

import Foundation

struct LocationDetails: Codable {
    let popularity: String?
    let nightlifeIndex: String?
    let nearbyRes: [String]?
    let location: CityLocation?
    let numRestaurant: Int?
    let bestRatedRestaurant: [RestaurantModel]?
}

struct CityLocation: Codable{
    let entityType: String?
    let entityId: Int?
    let title: String?
    let latitude: Double?
    let longitude: Double?
    let cityId: Int?
    let cityName: String?
    let countryId: Int?
    let countryName: String?
}

struct Restaurant: Codable {
    //  let R: R
    let apikey: String?
    let id: String?
    let name: String?
    let url: String?
    let location: RestaurantLocation?
    let cuisines: String?
    let averageCostForTwo: Int?
    let thumb: String?
    let userRating: UserRating?
    let allReviewsCount: Int?
    let phoneNumbers: String?
}


struct UserRating: Codable {
    let aggregateRating: String?
}

extension UserRating {
    var aggregateRatingInteger: Int {
        return aggregateRating?.convertToInteger() ?? 0
    }
}

struct R: Codable {
    
}

struct RestaurantModel: Codable {
    let restaurant: Restaurant?
}

struct RestaurantLocation: Codable {
    let address: String?
    let locality: String?
    let city: String?
    let cityId: Int?
    let latitude: String?
    let longitude: String?
    let zipcode: String?
    let countryId: Int?
    let localityVerbose: String?
}
