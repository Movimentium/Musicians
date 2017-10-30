//
//  Album.swift
//  Musicians
//
//  Created by AltUser on 29/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import UIKit


class Album {
    
    let name: String
    let date: String
    let artworkUrl: String
    var img: UIImage? 
    
    init(withName name: String, date: String, artworkUrl: String) {
        self.name = name
        self.date = date
        self.artworkUrl = artworkUrl
    }
}
