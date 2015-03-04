//
//  GlowAct.swift
//  HellGlow World
//
//  Created by Jeroen Berkvens on 04/03/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import Cocoa

class GlowAct: NSObject {
    var name: String;
    var rating: Float;
    var ratingCount: Int;
    var startTime: String;
    
    init(Name name: String, StartTime startTime: String){
        self.name = name;
        self.rating = 0;
        self.startTime = startTime;
        self.ratingCount = 0;
    }
    
    func addRating(Rating rating: Int) -> Void {
        var newRatingTotal: Float;
        newRatingTotal = self.rating * Float(self.ratingCount);
        newRatingTotal += Float(rating);
        self.ratingCount++;
        self.rating = newRatingTotal / Float(self.ratingCount);
    }
    
    func getInfo() -> String {
        return  String(format: "The act is called \(name) and starts at \(startTime). It is given an average rating of%02d", rating);
    }
    
    func addTestRatings() {
        var amountOfRatings = arc4random_uniform(695);
        if (amountOfRatings > 1){
            var minRating = Int(arc4random_uniform(5));
            for index in 1...amountOfRatings {
                var tmp = Int.random(lower: minRating, upper: 10);
                addRating(Rating: tmp);
            }
        }
    }
}

public extension Int {
    public static func random (#lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(upper - lower + 1))
    }
}
