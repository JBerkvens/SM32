//
//  ViewController.swift
//  PasswordManager
//
//  Created by Jeroen Berkvens on 07/04/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func findButtonAction(sender: AnyObject) {
        filterTableView();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    func filterTableView(){
    }
}

