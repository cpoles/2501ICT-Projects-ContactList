//
//  MasterTableViewCell.swift
//  ContactList
//
//  Created by Carlos Poles on 12/04/2016.
//  Copyright © 2016 Carlos Poles. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelFullName: UILabel!
    
    @IBOutlet weak var labelPhoneNumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
