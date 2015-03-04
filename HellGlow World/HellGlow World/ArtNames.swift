//
//  ArtNames.swift
//  HellGlow World
//
//  Created by Jeroen Berkvens on 04/03/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import Cocoa

struct NameGenerator {

    static func getName() -> String {
        var item1: NSMutableArray;
        var item2: NSMutableArray;
        var item3: NSMutableArray;
        var item4: NSMutableArray;
        
        item1 = NSMutableArray();
        item2 = NSMutableArray();
        item3 = NSMutableArray();
        item4 = NSMutableArray();
        
        item1[0] = "Breaking";
        item1[1] = "The Politics of";
        item1[2] = "Fantastic";
        item1[3] = "Decadent";
        item1[4] = "Queering";
        item1[5] = "Collective";
        item1[6] = "Romancing";
        item1[7] = "Mediating";
        item1[8] = "An Overwhelming";
        item1[9] = "Arbitrary";
        item1[10] = "Remixing";
        item1[11] = "For Love of";
        item1[12] = "Alchemical";
        item1[13] = "Apposite";
        item1[14] = "Extravagant";
        item1[15] = "Parsing";
        item1[16] = "Relational";
        item1[17] = "Postcolonial";
        item1[18] = "To Find the Properties of";
        item1[19] = "Archaeological";
        item1[20] = "After the";
        item1[21] = "In Search of";
        item1[22] = "Whither";
        item1[23] = "The Bureaucracies of";
        
        item2[0] = "Ground";
        item2[1] = "Dissent";
        item2[2] = "Illusion";
        item2[3] = "Rubbish";
        item2[4] = "Dreams";
        item2[5] = "Imagination";
        item2[6] = "Gaming";
        item2[7] = "Media";
        item2[8] = "Banality";
        item2[9] = "Charm";
        item2[10] = "History";
        item2[11] = "Chemistry";
        item2[12] = "Properties";
        item2[13] = "Relevance";
        item2[14] = "Extravaganza";
        item2[15] = "Dilettantes";
        item2[16] = "(Im)Possibilities";
        item2[17] = "Sustainability";
        
        item3[0] = "Cheating";
        item3[1] = "The Politics of";
        item3[2] = "The Video Art of";
        item3[3] = "Queers and";
        item3[4] = "Daring to Defy";
        item3[5] = "A Juried Show of";
        item3[6] = "Media Art and";
        item3[7] = "A Retrospective of";
        item3[8] = "15 Years of";
        item3[9] = "Defying";
        item3[10] = "John Waters and";
        item3[11] = "Locality and";
        item3[12] = "A Remix of";
        item3[13] = "Figuring";
        item3[14] = "The Disjunction of";
        item3[15] = "The Dysfunction of";
        item3[16] = "Post-Painterly Art of";
        item3[17] = "Achieving and Undermining";
        item3[18] = "Constructing a Praxis of";
        item3[19] = "Deconstructing";
        
        item4[0] = "the System";
        item4[1] = "Social Practice";
        item4[2] = "Gender";
        item4[3] = "the Status Quo";
        item4[4] = "Complacency";
        item4[5] = "Remediation";
        item4[6] = "Misfortune";
        item4[7] = "Damage";
        item4[8] = "Sameness";
        item4[9] = "Interactivity";
        item4[10] = "Change";
        item4[11] = "the Local";
        item4[12] = "Urban Experience";
        item4[13] = "the Avant Garde";
        item4[14] = "Dilettantism";
        item4[15] = "Juncture";
        item4[16] = "Dysfunction";
        item4[17] = "Progress";
        item4[18] = "Too Many Dinner Parties";
        item4[19] = "Aesthetic Forms and Their Opposites";
        
        var a = Int(24*((Float(arc4random_uniform(10000)))/10000));
        var b = Int(18*((Float(arc4random_uniform(10000)))/10000));
        var c = Int(20*((Float(arc4random_uniform(10000)))/10000));
        var d = Int(20*((Float(arc4random_uniform(10000)))/10000));
        
        return ("\(item1[a]) \(item2[b]) : \(item3[c]) \(item4[d])");
    }
}