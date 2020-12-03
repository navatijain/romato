//
//  LocationDetailsService.swift
//  Romato
//
//  Created by Navati Jain on 2020-11-28.
//

import Foundation

enum CustomError: String, Error {
    case Decoding
    case Service
}

class LocationDetailsService {
    
    private struct Constants{
        static let baseURL = "https://developers.zomato.com/api/v2.1/"
        static let locationDetails = "/location_details?entity_id=89&entity_type=city"
    }
    
    static func getLocationDetails(handler: @escaping (Result<LocationDetails,Error>) -> () ){
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.locationDetails)") else {
            handler(.failure(CustomError.Decoding))
            return
        }
        var request = URLRequest(url: url)
        
        request.setValue("04f9ace5b05be85764188952a5672d07", forHTTPHeaderField: "user-key")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse  {
              //  String(data)
                if httpResponse.statusCode == 200 {
                if let data = data, let locationDetails = try? JSONDecoder().decode(LocationDetails.self, from: data)  {
                    print(locationDetails)
                    handler(.success(locationDetails))
                } else {
                    handler(.failure(CustomError.Decoding))
                    return
                }
                
                } else {
                    print("Status code: \(httpResponse.statusCode)")
                    handler(.failure(CustomError.Service))
                }
            }
        }.resume()
    }
}
