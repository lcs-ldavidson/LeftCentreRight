//
//  Coin.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-03-11.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

struct Dice {
    var die : [Side] {
        return [.dot, .dot, .dot, .left, .centre, .right]
    }
    
    func roll() -> String {
        if let randomSide = die.randomElement() {
            print(randomSide)
            return(randomSide.rawValue)
        }
        return roll()
    }
}

