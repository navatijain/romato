//
//  LocationDetails.swift
//  Romato
//
//  Created by Navati Jain on 2020-11-28.
//

import Foundation

struct LocationDetails: Codable {
    let popularity: String?
    let nightlife_index: String?
    let nearby_res: [String]?
    let location: CityLocation?
    let num_restaurant: Int?
    let best_rated_restaurant: [RestaurantDictionary]?
    
}

struct RestaurantDictionary: Codable {
    let restaurant: Restaurant?
}

struct CityLocation: Codable{
    let entity_type: String?
    let entity_id: Int?
    let title: String?
    let latitude: Double?
    let longitude: Double?
    let city_id: Int?
    let city_name: String?
    let country_id: Int?
    let country_name: String?
}

struct Restaurant: Codable {
    //  let R: R
    let apikey: String?
    let id: String?
    let name: String?
    let url: String?
    //let location: RestaurantLocation
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
    let city_id: Int?
    let latitude: String?
    let longitude: String?
    let zipcode: String?
    let country_id: Int?
    let locality_verbose: String?
}
