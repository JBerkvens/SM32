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
    @IBOutlet weak var waitIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.passwordOrErrorLabel.hidden = true;
        self.copyButton.hidden = true;
        self.waitIndicator.hidden = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func find(sender: AnyObject) {
        self.waitIndicator.hidden = false;
        self.waitIndicator.startAnimating();
        let url = NSURL(string: "http://moridrin.com/ios/PasswordGenerator/getPassword.php?User=mp.berkvens@gmail.com&Name=" + Encryption.encrypt(nameTextField.text));
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            var dataString = NSString(data: data, encoding: NSUTF8StringEncoding) as! String;
            dataString.substringWithRange(Range<String.Index>(start: advance(dataString.startIndex, 9), end: advance(dataString.endIndex, -1)));
            self.passwordOrErrorLabel.text = Encryption.decrypt(dataString);
            self.passwordOrErrorLabel.hidden = false;
            self.copyButton.hidden = false;
            UIPasteboard.generalPasteboard().string = self.passwordOrErrorLabel.text;
            self.waitIndicator.hidden = true;
            self.waitIndicator.stopAnimating();
        }
        task.resume();
    }
    
    @IBAction func copyPassword(sender: AnyObject) {
        UIPasteboard.generalPasteboard().string = self.passwordOrErrorLabel.text;
    }
}
