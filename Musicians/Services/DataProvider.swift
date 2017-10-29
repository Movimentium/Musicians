//
//  DataProvider.swift
//  Musicians
//
//  Created by AltUser on 29/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import Foundation
import Alamofire

//https://itunes.apple.com/search?term=Mike&entity=musicArtist&country=ES&lang=es_es
//https://itunes.apple.com/search?term=Mike Oldfield&entity=album&country=ES&lang=es_es
class DataProvider {
    
    static let singleton = DataProvider()
    private init() {}
    
    var arrArtists: [Artist] = []
    let strURL = "https://itunes.apple.com/search"
    var params: Parameters = ["country":"ES", "lang":"es_es"]
    
    func callWebService(withSearchTerm term: String, isSearchForAlbums: Bool = false) {
        params["term"] = term
        params["entity"] = (isSearchForAlbums ? "album" : "musicArtist")
        Alamofire.request("https://httpbin.org/post", method: .get, parameters: params).validate().responseJSON
            { (response) in
                print("Response JSON: \(response.result.value ?? "null")")
                switch response.result {
                case .success(let value):
                    print("Response JSON: \(value)")
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    
}
