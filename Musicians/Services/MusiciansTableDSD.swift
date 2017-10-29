//
//  MusiciansTableDSD.swift
//  Musicians
//
//  Created by AltUser on 29/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//


import UIKit

protocol MusiciansTableDelegate {
    func musiciansTableDidSelectRow(atIndex idx: Int)
}

class MusiciansTableDSD: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var delegate: MusiciansTableDelegate?
    private let dataProv = DataProvider.singleton
    private var isTableConfig = false
    private let strIdCell = String(describing: MusiciansTableViewCell.self)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isTableConfig == false {
            tableView.rowHeight = 138
            tableView.register(UINib(nibName: strIdCell, bundle: nil),  forCellReuseIdentifier: strIdCell)
            isTableConfig = true
        }
        return dataProv.arrArtists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: strIdCell, for: indexPath) as! MusiciansTableViewCell
        let artist = dataProv.arrArtists[indexPath.row]
        cell.lblArtistName.text = artist.name
        cell.lblGenre.text = artist.genre
        let numOfAlbums = artist.arrAlbums.count
        cell.lblAlbum1.text = (numOfAlbums >= 1 ? artist.arrAlbums[0].name : "")
        cell.lblAlbum2.text = (numOfAlbums >= 2 ? artist.arrAlbums[1].name : "")
        cell.areMoreAlbums = numOfAlbums > 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.musiciansTableDidSelectRow(atIndex: indexPath.row)
    }
}

