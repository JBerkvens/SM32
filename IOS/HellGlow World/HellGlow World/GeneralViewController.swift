//
//  GeneralViewController.swift
//  HellGlow World
//
//  Created by Jeroen Berkvens on 19/03/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import Foundation
import UIKit

class GeneralViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showTextField(sender: AnyObject) {
        var alertView = UIAlertView(title: "This is what you typed:", message: textField.text, delegate: nil, cancelButtonTitle: "Close");
        alertView.show();
    }
    
    @IBOutlet weak var textField: UITextField!
}