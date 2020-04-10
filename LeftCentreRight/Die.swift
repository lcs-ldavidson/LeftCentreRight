//
//  Coin.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-03-11.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

struct Dice {
    
    static var die : [Side] {
        return [.dot, .dot, .dot, .left, .centre, .right]
    }
    
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

