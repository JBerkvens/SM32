//
//  ViewController.swift
//  PasswordManager
//
//  Created by Jeroen Berkvens on 15/04/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import UIKit

class FindController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var passwordOrErrorLabel: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.passwordOrErrorLabel.hidden = true;
        self.copyButton.hidden = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func find(sender: AnyObject) {
        self.passwordOrErrorLabel.text = "nbuiyvktcj32t68gy&*#";
        self.passwordOrErrorLabel.hidden = false;
        self.copyButton.hidden = false;
        UIPasteboard.generalPasteboard().string = self.passwordOrErrorLabel.text;
    }
    
    @IBAction func copyPassword(sender: AnyObject) {
        UIPasteboard.generalPasteboard().string = self.passwordOrErrorLabel.text;
    }
}
