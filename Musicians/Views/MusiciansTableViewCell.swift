//
//  MusiciansTableViewCell.swift
//  Musicians
//
//  Created by AltUser on 28/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import UIKit

class MusiciansTableViewCell: UITableViewCell {

    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var lblDiscography: UILabel!
    @IBOutlet weak var lblAlbum1: UILabel!
    @IBOutlet weak var lblAlbum2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
