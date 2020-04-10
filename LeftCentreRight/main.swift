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
    
    //Create a function to see if someone has lost all their money
    mutating func checkIfPlayerHasMoney () {
        
        //Check to see if the current player field has any coins
        if gameIsOngoing {
            if currentTurnPlayer.field.collectionOfCoins.count <= 0 {
                print("The player \(currentTurnPlayer.name) has no coins")
                
                //If the player has coins, print how many they have
            } else if currentTurnPlayer.field.collectionOfCoins.count > 0 {
                print("The player \(currentTurnPlayer.name) has \(currentTurnPlayer.field.collectionOfCoins) coins")
            }
        }
    }
    
    func playTurn() {
        if gameIsOngoing {              
            for _ in 1...currentTurnPlayer.diceToRoll() {
                
            }
        }
    }
    
}


