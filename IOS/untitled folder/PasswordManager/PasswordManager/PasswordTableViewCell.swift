//
//  PasswordTableViewCell.swift
//  PasswordManager
//
//  Created by Jeroen Berkvens on 16/04/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import UIKit

class PasswordTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var showCopyButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        passwordLabel.hidden = true;
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func showCopyActionPreformed(sender: AnyObject) {
        if (self.passwordLabel.hidden) {
            self.passwordLabel.hidden = false;
            self.showCopyButton.titleLabel?.text = "Copy";
        } else {
            UIPasteboard.generalPasteboard().string = self.passwordLabel.text;
        }
    }
}
