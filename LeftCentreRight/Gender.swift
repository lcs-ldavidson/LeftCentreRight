//
//  Gender.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-04-17.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

//enumeration for genders
enum Gender : String {
    
    //possible genders
    case male = "male", female = "female"
    
    //string literal for possesive pronouns
    var possessivePronoun : String {
        switch self {
        case .male: return "His"
        case .female: return "Her"
        }
    }
    
    //string literal for pronouns
    var pronoun : String {
        switch self {
        case .male: return "He"
        case .female: return "She"
        }
    }
    
    //string literal for possesive pronouns
    var pluralPossessivePronoun : String {
        switch self {
        case .male: return "his"
        case .female: return "hers"
        }
    }
    
}
