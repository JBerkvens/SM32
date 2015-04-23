//
//  RandomString.swift
//  PasswordManager
//
//  Created by Jeroen Berkvens on 17/04/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import Foundation

class RandomString {

    let lowerCase : String = "abcdefghijklmnopqrstuvwxyz";
    let upperCase : String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    let numbers : String = "0123456789";
    let special : String = "!@#$%^&*()-_=+[]{};:\\|?/.>,<~";
    
    var length : Int;
    var caseType : Case;
    var include : [Character];
    var specialInclude : [Character];
    
    init() {
        length = 20;
        caseType = Case.Both;
        include = Array(self.lowerCase + self.upperCase + self.numbers);
        specialInclude = Array(self.special);
    }

    func new() -> String {
        var returnerArray = [Character?](count: self.length, repeatedValue: nil);
        for i in 0...(self.length - 1) {
            returnerArray[i] = self.include[Int(arc4random_uniform(UInt32(self.include.endIndex)))];
        }
        var usedSpecialLocations : [Int] = [];
        for i in 0...(self.length / 4) {
            let currentRandomPlace = Int(arc4random_uniform(UInt32(returnerArray.endIndex)));
            if !contains(usedSpecialLocations, currentRandomPlace) {
                returnerArray[currentRandomPlace] = self.specialInclude[Int(arc4random_uniform(UInt32(self.specialInclude.endIndex)))];
            }
        }
        var password : String = "";
        for var i = 0; i < returnerArray.count; i++ {
            password += String(returnerArray[i]!);
        }
        println(password);
        return password;
    }
    
    func set(length : Int) {
        self.length = length;
    }
    
    func set(specialCharacters : Bool) {
        if specialCharacters {
            specialInclude = Array(special);
        } else {
            specialInclude = [];
        }
    }
    
    func set(exclude : [Character]) {
        var tmp : String = String(self.specialInclude);
        for char : Character in exclude {
            tmp = tmp.stringByReplacingOccurrencesOfString(String(char), withString: "");
        }
        self.specialInclude = Array(tmp);
    }
    
    func set(caseType : Case) {
        switch caseType {
        case Case.Both:
            self.include = Array(lowerCase + upperCase + numbers);
            break;
        case Case.CapsOnly:
            self.include = Array(upperCase + numbers);
            break;
        case Case.LowerOnly:
            self.include = Array(lowerCase + numbers);
            break;
        }
    }
}