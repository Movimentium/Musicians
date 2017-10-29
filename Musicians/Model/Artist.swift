//
//  Artist.swift
//  Musicians
//
//  Created by AltUser on 29/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import Foundation

class Artist {
    
    let name: String
    let genre: String
    var arrAlbums: [Album] = []
    
    init(withName name: String, genre: String) {
        self.name = name
        self.genre = genre
    }
}
