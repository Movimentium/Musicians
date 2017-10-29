//
//  DataProvider.swift
//  Musicians
//
//  Created by AltUser on 29/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol DataProviderDelegate {
    func dataProvider(didFinishOk: Bool, withError error: Error?);
}

class DataProvider {
    
    static let singleton = DataProvider()
    private init() {}
    
    var selectedIndex: Int?
    var arrArtists: [Artist] = []
    var delegate: DataProviderDelegate?
    private var currentArtistIdx = 0
    private let strURL = "https://itunes.apple.com/search"
    private var params: Parameters = ["country":"ES", "lang":"es_es", "limit": 10]
    private var arrAlbumsDownloadErrors: [Error] = []
    
    func callWebService(withSearchTerm term: String, isSearchForAlbums: Bool = false) {
        params["term"] = term
        params["entity"] = (isSearchForAlbums ? "album" : "musicArtist")
        Alamofire.request(strURL, method: .get, parameters: params).validate().responseJSON
            { [weak self] (response) in
                guard let wSelf = self else { fatalError("self == nil") }
                if isSearchForAlbums {
                    switch response.result {
                    case .success(let value):
                        print("Response JSON: \(value)")
                        wSelf.parseAlbum(json: JSON(value))
                    case .failure(let error):
                        wSelf.arrAlbumsDownloadErrors.append(error)
                    }
                    //print(wSelf.currentArtistIdx)
                    wSelf.currentArtistIdx += 1
                    if wSelf.currentArtistIdx < wSelf.arrArtists.count{
                        let name = wSelf.arrArtists[wSelf.currentArtistIdx].name
                        wSelf.callWebService(withSearchTerm: name, isSearchForAlbums: true)
                    } else {
                        wSelf.delegate?.dataProvider(didFinishOk: true, withError: nil)
                    }
                } else {
                    switch response.result {
                    case .success(let value):
                        print("Response JSON: \(value)")
                        wSelf.parseArtist(json: JSON(value))
                    case .failure(let error):
                        wSelf.delegate?.dataProvider(didFinishOk: false, withError: error)
                    }
                }
        }
    }
    
    private func parseArtist(json: JSON) {
        let arrResults = json["results"].arrayValue
        arrArtists = []
        for result in arrResults {
            let name = result["artistName"].stringValue
            let genre = result["primaryGenreName"].stringValue
            arrArtists.append(Artist(withName: name, genre: genre))
        }
        if arrArtists.isEmpty {
            return
        }
        currentArtistIdx = 0
        let name = arrArtists[currentArtistIdx].name
        callWebService(withSearchTerm: name, isSearchForAlbums: true)
    }
    
    private func parseAlbum(json: JSON) {
        let arrResults = json["results"].arrayValue
        for result in arrResults {
            let name = result["collectionName"].stringValue
            let date = result["releaseDate"].stringValue
            let artworkUrl60 = result["artworkUrl60"].stringValue
            let album = Album(withName: name, date: date, artworkUrl60: artworkUrl60)
            arrArtists[currentArtistIdx].arrAlbums.append(album)
        }
    }
}
