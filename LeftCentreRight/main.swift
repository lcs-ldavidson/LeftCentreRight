//
//  main.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-03-11.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

//structure to represent the table at which the players...play
struct Game {
    
    var players : [Player]
    var currentTurnPlayer : Player
    var centrePot : Stash = Stash(initialCoins: [])
    
    
}
