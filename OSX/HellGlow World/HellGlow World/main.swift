//
//  main.swift
//  HellGlow World
//
//  Created by Jeroen Berkvens on 04/03/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import Foundation;

println("HellGlow  World!");

var testAct: GlowAct;
testAct = GlowAct(Name: "TestAct", StartTime: "11:00");
println(testAct.getInfo());

var eindhoven: City;
eindhoven = City(Name: "Eindhoven", Population: 300000);
eindhoven.addGlowAct(GlowAct: testAct);

for index in 1...arc4random_uniform(326) {
    var indexLeft = index;
    var timeMinutes = 0;
    var timeHours = 0;
    var time: String;
    while (indexLeft > 1) {
        timeMinutes += 10;
        if (timeMinutes > 50) {
            if (timeMinutes > 59) {
                timeMinutes = 5;
            } else {
                timeMinutes = 0;
            }
            timeHours++;
            if (timeHours > 23){
                timeHours = 0;
            }
        }
        indexLeft--;
    }
    time =  String(format: "%02d:%02d", timeHours, timeMinutes);
    var act = GlowAct(Name: NameGenerator.getName(), StartTime: time);
    act.addTestRatings();
    eindhoven.addGlowAct(GlowAct: act);
}

eindhoven.printInfo();
