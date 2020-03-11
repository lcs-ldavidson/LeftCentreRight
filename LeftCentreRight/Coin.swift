//
//  Coin.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-03-11.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

//Coin enumeration
enum Coin: Double {
    
    //all the possible coins with values as rawValues
    case toonie = 2.00, loonie = 1.00, quarter = 0.25, dime = 0.10, nickel = 0.05
    
    //computed value for the monetary value of each coin to make things more readable
    var value : Double {
        switch self {
        default:
            return self.rawValue
        }
    }
    
    //static variable for lowest value coin
    static var leastValuableCoin : Coin {
        return .nickel
    }
    
    //static variable for most valuable coin
    static var mostValuableCoin : Coin {
        return .toonie
    }
    
    //computed value for the name of the coin as a string
    var name : String {
        switch self {
        case .toonie: return "toonie"
        case .loonie: return "loonie"
        case .quarter: return "quarter"
        case .dime: return "dime"
        case .nickel: return "nickel"
        }
    }
    
    //computed value for the worth of a coin as a string
    var worthDescription : String {
        switch self {
        case .toonie: return "$2.00"
        case .loonie: return "$1.00"
        case .quarter: return "$0.25"
        case .dime: return "$0.10"
        case .nickel: return "$0.05"
        }
    }
    
    //description of the coin and its value
    var description : String {
        return "a \(self.name) worth \(self.worthDescription)"
    }
    
}
