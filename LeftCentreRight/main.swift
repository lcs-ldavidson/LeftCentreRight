//
//  main.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-03-11.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

//structure to represent the table at which the players...play
struct LCRGame {
    
    //properties
    var players : FriendGroup
    var currentTurnPlayer : Player
    var centrePot : Stash = Stash(initialCoins: [])
    var gameIsOngoing : Bool = true
    
    //initializer so the game can automatically determine that the first one to play is the poorest player
    init(whoIsPlaying players: FriendGroup) {
        self.players = players
        self.currentTurnPlayer = players.mostPoorPlayer
    }
    
    //the function to begin playing the game
    mutating func playLCR() {
        self.gameIsOngoing = true
    }
    
    //initial description of the game
    func openingDescriptions() {
        print("""
            Welcome to Left Centre Right!
            This game will be played by \(players.namesOfAllPlayers). \(players.mostWealthyPlayer.name) is the wealthiest player, for their stash is worth $\(players.mostWealthyPlayer.collection.totalMonetaryValue).
            \(players.mostPoorPlayer.name) is the poorest player, only having $\(players.mostPoorPlayer.collection.totalMonetaryValue), and therefore must go first.
            """)
        
        for describingPlayer in players.group {
            print("\(describingPlayer.name) has \(describingPlayer.collection.collectionOfCoins.count) coins worth a total of $\(describingPlayer.collection.totalMonetaryValue). Their stash is made up of \(describingPlayer.collection.stashDescription).")
        }
        
    }
    
    //function to swap the current turn player to the next in sequence
    mutating func passTurn() {
        if players.findIndexOfPlayer(targetPlayer: currentTurnPlayer) == players.group.count - 1 {
            currentTurnPlayer = players.group[0]
        } else {
            currentTurnPlayer = players.group[players.findIndexOfPlayer(targetPlayer: currentTurnPlayer) + 1]
        }
    }
    
    //function to setup the game by moving coins into the players' fields
    func setup() {
        for setupPlayer in players.group {
            setupPlayer.collection.randomizeCoins()
            setupPlayer.collection.moveCoinsTo(destination: setupPlayer.field, howManyCoins: 3)
        }
    }
    
    //Crate a function to see if someone has money
    mutating func checkIfPlayerHasMoney() -> Bool {
        
        //Create variable to see if the player can proceed with the turn
        var keepOnGoing: Bool = false
        
        //Check to see if the player has more than zero coins
        if currentTurnPlayer.field.collectionOfCoins.count > 0 {
            print("The player \(currentTurnPlayer.name) has \(currentTurnPlayer.field.collectionOfCoins) coins")
            keepOnGoing = true
            
            //Check to see if the player has zero coins
        } else if currentTurnPlayer.field.collectionOfCoins.count <= 0 {
            print("The player \(currentTurnPlayer.name) has no coins")
            keepOnGoing = false
        }
        return keepOnGoing
    }
    
    //Function that will run during the current player's turn
    mutating func playTurn() {
        if gameIsOngoing {
            //Check to see if the player has money, if yes the turn may continue
            if checkIfPlayerHasMoney() == false {
                passTurn()
            } else if checkIfPlayerHasMoney() == true {
                
            }
        }
    }
    
}


