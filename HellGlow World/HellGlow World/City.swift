//
//  City.swift
//  HellGlow World
//
//  Created by Jeroen Berkvens on 04/03/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import Cocoa

class City: NSObject {
    var name: String;
    var population: Int;
    var glowActs: NSMutableArray;
    
    init(Name name: String, Population population: Int){
        self.name = name;
        self.population = population;
        self.glowActs = NSMutableArray();
    }
    
    func addCitizen() -> Void {
        self.population++;
    }
    
    func addCitizens(AmountOfCitizens amount: Int) -> Void {
        self.population += amount;
    }
    
    func removeCitizen() -> Void {
        self.population--;
    }
    
    func removeCitizens(AmountOfCitizens amount: Int) -> Void {
        self.population -= amount;
    }
    
    func addGlowAct(GlowAct glowAct: GlowAct) -> Void {
        self.glowActs.addObject(glowAct);
    }
    
    func removeGlowAct(GlowAct glowAct: GlowAct) -> Void {
        self.glowActs.removeObject(glowAct);
    }
    
    func getInfo() -> String {
        return "In the city of \(name) there are currently living \(population) people and at Glow they show \(glowActs.count) acts.";
    }
    
    func printInfo() -> Void {
        println("In the city of \(name) there are currently living \(population) people and at Glow they show \(glowActs.count) acts.");
        if (self.glowActs.count > 0) {
            print("Would you like to see all Glow Acts in this city? (Y/n) ");
            var keyboard = NSFileHandle.fileHandleWithStandardInput();
            var inputData = keyboard.availableData;
            var input = NSString(data: inputData, encoding:NSUTF8StringEncoding)!;
            if (input.uppercaseString == "Y\n") {
                var currentArt = 0;
                for obj : AnyObject in self.glowActs {
                    var glowAct = obj as GlowAct;
                    currentArt++;
                    println("\tActNr \(currentArt):  \(glowAct.name)");
                    println("\t\t\t\tStart Time: \(glowAct.startTime)");
                    println(String(format: "\t\t\t\tRating: %.1f", glowAct.rating));
                }
            }
        }
    }
}
