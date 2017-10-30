//
//  MusiciansMainViewController.swift
//  Musicians
//
//  Created by AltUser on 28/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import UIKit

class MusiciansMainViewController: UIViewController, DataProviderDelegate, MusiciansTableDelegate, UISearchBarDelegate
{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var musiciansTable: UITableView!
    @IBOutlet weak var lblInfo: UILabel!
    
    let dataProv = DataProvider.singleton
    let musiciansTableDSD = MusiciansTableDSD()
    let waitVC = WaitingViewController.newWaitVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musiciansTableDSD.delegate = self
        musiciansTable.dataSource = musiciansTableDSD
        musiciansTable.delegate = musiciansTableDSD
        searchBar.delegate = self
        dataProv.delegate = self
        lblInfo.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func dataProvider(didFinishOk: Bool, withError error: Error?) {
        waitVC.dismiss(animated: true, completion: nil)
        if didFinishOk == false {
            musiciansTable.isHidden = true
            lblInfo.text = "Ha ocurrido un error"
            return
        }
        if dataProv.arrArtists.isEmpty {
            musiciansTable.isHidden = true
            lblInfo.text = "No se han encontrado nada"
        } else {
            musiciansTable.reloadData()
        }
    }
    
    func dataProvider(didFinishDownloadAlbumsImages: Bool, withError error: Error?) {
        waitVC.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "showDetail", sender: nil)
    }

    
    func musiciansTableDidSelectRow(atIndex idx: Int) {
        musiciansTable.deselectRow(at: IndexPath(row: idx, section: 0), animated: false)
        if dataProv.arrArtists[idx].arrAlbums.count <= 2 {
            return
        }
        dataProv.selectedIndex = idx
        present(waitVC, animated: true, completion: nil)
        dataProv.downloadAlbumImages()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        if let term = searchBar.text?.trimmingCharacters(in: .whitespaces){
            present(waitVC, animated: true, completion: nil)
            dataProv.callWebService(withSearchTerm: term)
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        musiciansTable.isHidden = false
        lblInfo.text = ""
    }
}
