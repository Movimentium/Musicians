//
//  AlbumTableViewCell.swift
//  Musicians
//
//  Created by AltUser on 30/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
