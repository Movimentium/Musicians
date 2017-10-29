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
    
    let dataProv = DataProvider.singleton
    let musiciansTableDSD = MusiciansTableDSD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musiciansTableDSD.delegate = self
        musiciansTable.dataSource = musiciansTableDSD
        musiciansTable.delegate = musiciansTableDSD
        searchBar.delegate = self
        dataProv.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func dataProvider(didFinishOk: Bool, withError error: Error?) {
        musiciansTable.reloadData()
    }

    
    func musiciansTableDidSelectRow(atIndex idx: Int) {
        dataProv.selectedIndex = idx
        performSegue(withIdentifier: "showDetail", sender: nil)
        musiciansTable.deselectRow(at: IndexPath(row: idx, section: 0), animated: false)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let term = searchBar.text?.trimmingCharacters(in: .whitespaces){
            dataProv.callWebService(withSearchTerm: term)
        }
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
