//
//  Album.swift
//  Musicians
//
//  Created by AltUser on 29/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import Foundation


class Album {
    
    let name: String
    let date: String
    let artworkUrl60: String
    
    init(withName name: String, date: String, artworkUrl60: String) {
        self.name = name
        self.date = date
        self.artworkUrl60 = artworkUrl60
    }
}
