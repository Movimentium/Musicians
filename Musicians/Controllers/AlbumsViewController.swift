//
//  AlbumsViewController.swift
//  Musicians
//
//  Created by AltUser on 28/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    @IBOutlet weak var albumsTable: UITableView!
    let artist: Artist = DataProvider.singleton.arrArtists[DataProvider.singleton.selectedIndex!]
    let albumsTableDSD = AlbumsTableDSD()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = artist.name
        navigationController?.setNavigationBarHidden(false, animated: true)
        albumsTable.dataSource = albumsTableDSD
        albumsTable.delegate = albumsTableDSD
    }

}
