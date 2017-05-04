//
//  PlanetaTableViewCell.swift
//  PlanetasSQLite
//
//  Created by Aplimovil on 4/05/17.
//  Copyright © 2017 Aplimovil. All rights reserved.
//

import UIKit

class PlanetaTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gravity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
