//
//  PasswordTableViewCell.swift
//  PasswordManager
//
//  Created by Jeroen Berkvens on 10/04/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import UIKit

class PasswordTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var password: UILabel!
    
    @IBAction func copyButtonPressed(sender: AnyObject) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
