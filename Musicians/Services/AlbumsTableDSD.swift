//
//  AlbumsTableDSD.swift
//  Musicians
//
//  Created by AltUser on 30/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import UIKit

class AlbumsTableDSD: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    //var delegate: MusiciansTableDelegate?
    private let dataProv = DataProvider.singleton
    private var isTableConfig = false
    private let strIdCell = String(describing: AlbumTableViewCell.self)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isTableConfig == false {
            tableView.rowHeight = 76
            tableView.register(UINib(nibName: strIdCell, bundle: nil),  forCellReuseIdentifier: strIdCell)
            isTableConfig = true
        }
        return dataProv.arrArtists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: strIdCell, for: indexPath) as! AlbumTableViewCell
        let artist = dataProv.arrArtists[dataProv.selectedIndex!]
        let album = artist.arrAlbums[indexPath.row]
        cell.lblName.text = album.name
        cell.lblYear.text = album.date
        //cell.lblGenre.text = artist.genre
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //delegate?.musiciansTableDidSelectRow(atIndex: indexPath.row)
    }
}

