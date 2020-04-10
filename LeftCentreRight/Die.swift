//
//  Coin.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-03-11.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

// Create structure for dice
struct Dice {
    
    // Create a single die that returns the desired elements
    static var die : [Side] {
        return [.dot, .dot, .dot, .left, .centre, .right]
    }
    
    // Create a function to roll the die and return a random element (side)
    static func roll() -> Side {
        
        var rolledSide : Side
        
        rolledSide = die.randomElement()!
        return rolledSide
        //        if let randomSide = die.randomElement() {
        //            print(randomSide)
        //            return(randomSide.rawValue)
        //        }
        //        return roll()
    }
}

