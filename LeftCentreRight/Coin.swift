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
    
    //All the possible coins with values as rawValues
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
    
    //mass of the coin in grams
    var massInGrams : Double {
        switch self {
        case .toonie: return 6.92
        case .loonie: return 6.27
        case .quarter: return 4.4
        case .dime: return 1.75
        case .nickel: return 3.95
        }
    }
    
    //premade collection of coins for wealthy players
    static var wealthyCollection : [Coin] {
        return Array(repeatElement(Coin.quarter, count: 5)) + Array(repeatElement(Coin.loonie, count: 4)) + Array(repeatElement(Coin.toonie, count: 3))
    }
    
    //premade collection of coins for middle class players
    static var standardCollection : [Coin] {
        return Array(repeatElement(Coin.dime, count: 5)) + Array(repeatElement(Coin.quarter, count: 4)) + Array(repeatElement(Coin.loonie, count: 3))
    }
    
    //premade collection of coins for poor players
    static var poorCollection : [Coin] {
        return Array(repeatElement(Coin.nickel, count: 5)) + Array(repeatElement(Coin.dime, count: 4)) + Array(repeatElement(Coin.quarter, count: 3))
    }
    
    //function to create and return an array of coins made up of the specified coins
    static func stashMadeOf(Nickels: Int, Dimes: Int, Quarters: Int, Loonies: Int, Toonies: Int) -> [Coin] {
        return Array(repeatElement(Coin.nickel, count: Nickels)) + Array(repeatElement(Coin.dime, count: Dimes)) + Array(repeatElement(Coin.quarter, count: Quarters)) + Array(repeatElement(Coin.loonie, count: Loonies)) + Array(repeatElement(Coin.toonie, count: Toonies))
    }
    
}
