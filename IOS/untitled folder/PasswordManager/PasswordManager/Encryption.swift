//
//  Encryption.swift
//  PasswordManager
//
//  Created by Jeroen Berkvens on 17/04/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import Foundation

class Encryption {
    
    static func encrypt(string : String) -> String {
        return encrypt(string, toLower: true);
    }
    
    static func encrypt(var string : String, toLower : Bool) -> String {
        if (toLower) {
            string = string.lowercaseString;
        }
        string = string.stringByReplacingOccurrencesOfString(" ", withString: "");
        var charArray = Array(string);
        var usedIntegers : [Int] = [];
        var encrypted : [Character] = [];
        var i = 0;
        for c in charArray {
            encrypted[i] = c;
            usedIntegers.append(i);
            if (usedIntegers.count < charArray.count) {
                i = nextNumber(charArray, i: i, placedChar: c, usedIntegers: usedIntegers);
            }
        }
        var stringBuilder = "";
        for c in encrypted {
            stringBuilder.append(c);
        }
        return stringBuilder;
    }
    
    static func decrypt(string : String) -> String{
        var encrypted = Array(string);
        var charArray = [Character?](count:encrypted.count, repeatedValue: nil);
        var usedIntegers : [Int] = [];
        var i = 0;
        for j in 0...(encrypted.count - 1) {
            charArray[j] = encrypted[i];
            usedIntegers.append(i);
            if (usedIntegers.count < charArray.count) {
                i = nextNumber(encrypted, i: i, placedChar: charArray[j]!, usedIntegers: usedIntegers);
            }
        }
        var stringBuilder = "";
        for c in charArray {
            stringBuilder.append(c!);
        }
        return stringBuilder;
    }
    
    static func nextNumber(charArray : [Character], i : Int, placedChar : Character, usedIntegers : [Int]) -> Int {
        var placedCharAsString = String(placedChar);
        var valuesOfCharAsString = placedCharAsString.unicodeScalars;
        var valueOfCharAsSomething = valuesOfCharAsString[valuesOfCharAsString.startIndex];
        var valueOfChar : Int = Int(valueOfCharAsSomething.value);
        var i = i;
        i = charArray.count + valueOfChar;
        i = i % charArray.count;
        var t = 0;
        while (contains(usedIntegers, i)) {
            i++;
            if (i >= charArray.count) {
                i = 1;
            }
        }
        return i;
    }
}