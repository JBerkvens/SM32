//
//  ViewController.swift
//  PasswordManager
//
//  Created by Jeroen Berkvens on 15/04/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import UIKit

class GenerateController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var lengthSlider: UISlider!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var includeTextField: UITextField!
    @IBOutlet weak var excludeTextField: UITextField!
    @IBOutlet weak var passwordOrErrorLabel: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.passwordOrErrorLabel.hidden = true;
        self.copyButton.hidden = true;
        self.generateButton.enabled = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func lengthSliderValueChanged(sender: AnyObject) {
        self.lengthTextField.text = NSString(format: "%.0f", self.lengthSlider.value) as String;
    }
    
    @IBAction func didEndOnExit(sender: UITextField) {
        switch (sender) {
        case self.lengthTextField:
            self.includeTextField.becomeFirstResponder();
            break;
        case self.includeTextField:
            self.excludeTextField.becomeFirstResponder();
            break;
        default:
            self.nameTextField.becomeFirstResponder();
            break;
        }
    }
    
    @IBAction func nameTextBoxValueChanged(sender: AnyObject) {
        if (self.nameTextField.text.isEmpty || self.lengthTextField.text.isEmpty){
            self.generateButton.enabled = false;
        } else {
            self.generateButton.enabled = true;
        }
    }
    
    @IBAction func lengthTextBoxValueChanged(sender: AnyObject) {
        if (self.nameTextField.text.isEmpty || self.lengthTextField.text.isEmpty){
            self.generateButton.enabled = false;
        } else {
            self.generateButton.enabled = true;
            if (self.lengthTextField.text.toInt() > 100){
                self.lengthTextField.text = "100";
            }
            self.lengthSlider.setValue((self.lengthTextField.text as NSString).floatValue, animated: false);
        }
    }
    
    @IBAction func generate(sender: AnyObject) {
        self.passwordOrErrorLabel.text = "nbuiyvktcj32t68gy&*#bbik";
        self.passwordOrErrorLabel.hidden = false;
        self.copyButton.hidden = false;
        UIPasteboard.generalPasteboard().string = self.passwordOrErrorLabel.text;
    }
    
    @IBAction func copyPassword(sender: AnyObject) {
        UIPasteboard.generalPasteboard().string = self.passwordOrErrorLabel.text;
    }
}
