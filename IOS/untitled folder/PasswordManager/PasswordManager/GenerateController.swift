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
    @IBOutlet weak var specialCharactersSwitch: UISwitch!
    @IBOutlet weak var excludeTextField: UITextField!
    @IBOutlet weak var passwordOrErrorLabel: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var waitIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.passwordOrErrorLabel.hidden = true;
        self.copyButton.hidden = true;
        self.generateButton.enabled = false;
        self.waitIndicator.hidden = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func lengthSliderValueChanged(sender: AnyObject) {
        self.passwordOrErrorLabel.hidden = true;
        self.copyButton.hidden = true;
        self.lengthTextField.text = NSString(format: "%.0f", self.lengthSlider.value) as String;
    }
    
    @IBAction func didEndOnExit(sender: UITextField) {
        switch (sender) {
        case self.lengthTextField:
            self.excludeTextField.becomeFirstResponder();
            break;
        default:
            self.nameTextField.becomeFirstResponder();
            break;
        }
    }
    
    @IBAction func clearField(sender: AnyObject) {
        self.passwordOrErrorLabel.hidden = true;
        self.copyButton.hidden = true;
    }
    
    @IBAction func nameTextBoxValueChanged(sender: AnyObject) {
        self.passwordOrErrorLabel.hidden = true;
        self.copyButton.hidden = true;
        if (self.nameTextField.text.isEmpty || self.lengthTextField.text.isEmpty){
            self.generateButton.enabled = false;
        } else {
            self.generateButton.enabled = true;
        }
    }
    
    @IBAction func lengthTextBoxValueChanged(sender: AnyObject) {
        self.passwordOrErrorLabel.hidden = true;
        self.copyButton.hidden = true;
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
    @IBAction func specialCharactersSwitchValueChanged(sender: AnyObject) {
        if specialCharactersSwitch.on {
            excludeTextField.enabled = true;
        } else {
            excludeTextField.enabled = false;
        }
    }
    
    @IBAction func generate(sender: AnyObject) {
        self.passwordOrErrorLabel.hidden = true;
        self.copyButton.hidden = true;
        self.waitIndicator.hidden = false;
        self.waitIndicator.startAnimating();
        let password = Encryption.encrypt(generatePassword(), toLower: false);
        let name = Encryption.encrypt(nameTextField.text);
        
        let myURL = NSURL(string: "http://moridrin.com/ios/PasswordGenerator/pushToServer.php")!
        let request = NSMutableURLRequest(URL: myURL)
        request.HTTPMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let bodyStr:String = "User=mp.berkvens@gmail.com&Name=" + name + "&Password=" + password;
        request.HTTPBody = bodyStr.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            let returningData : String = String(NSString(data: data, encoding: NSUTF8StringEncoding)!);
            if returningData.rangeOfString("successfull") != nil {
                self.passwordOrErrorLabel.text = Encryption.decrypt(password);
                self.passwordOrErrorLabel.hidden = false;
                self.copyButton.hidden = false;
            } else {
                self.passwordOrErrorLabel.text = "An error occured: " + returningData;
                self.passwordOrErrorLabel.hidden = false;
            }
            self.waitIndicator.hidden = true;
            self.waitIndicator.stopAnimating();
        }
        task.resume()
    }
    
    @IBAction func copyPassword(sender: AnyObject) {
        UIPasteboard.generalPasteboard().string = self.passwordOrErrorLabel.text;
    }
    
    func generatePassword() -> String {
        var randomString : RandomString = RandomString();
        randomString.set(lengthTextField.text.toInt()!);
        randomString.set(specialCharactersSwitch.on);
        randomString.set(Array(excludeTextField.text!));
        var password : String = randomString.new();
        UIPasteboard.generalPasteboard().string = password;
        return password;
    }
}
