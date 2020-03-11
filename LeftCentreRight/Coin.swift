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

    
}
