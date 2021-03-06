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
    var interactiveMode : Bool = true
    
    //initializer so the game can automatically determine that the first one to play is the poorest player
    init(whoIsPlaying players: FriendGroup) {
        self.players = players
        self.currentTurnPlayer = players.mostPoorPlayer
    }
    
    //the function to begin playing the game
    mutating func playLCR() {
        openingDescriptions()
        setup()
        
        while gameIsOngoing {
            playTurn()
        }
        
        declareWinner(winner: currentTurnPlayer)
        
    }
    
    //initial description of the game
    func openingDescriptions() {
        print("""
            Welcome to Left Centre Right!
            
            The rules are simple:
            1) Each player needs a minimum of 3 coins
            
            2) The amount of dice you roll corresponds to the amount of coins in your stash. If you have 3 or more coins, you roll 3 times
            
            3) The dice are made up of 3 dots, 1 L, 1 C, 1 R
            
            4) A dot means you keep your coin. An L means you give your coin to the player on your left. A C means you give your coin to the centre pot. An R means you give your coin to the player on your right
            \n====================================================================\n
            This game will be played by \(players.namesOfAllPlayers). \(players.mostWealthyPlayer.name) is the wealthiest player, for \(players.mostWealthyPlayer.playerGender.possessivePronoun) stash is worth $\(players.mostWealthyPlayer.collection.totalMonetaryValue).
            
            \(players.mostPoorPlayer.name) is the poorest player, only having $\(players.mostPoorPlayer.collection.totalMonetaryValue), and therefore must go first.
            
            """)
        
        waitForUserInput()
        print("\n====================================================================\n")
        
        for describingPlayer in players.group {
            print("""
                \(describingPlayer.name) has \(describingPlayer.collection.collectionOfCoins.count) coins worth a total of $\(describingPlayer.collection.totalMonetaryValue). \(describingPlayer.playerGender.possessivePronoun) stash is made up of
                \(describingPlayer.collection.nickleCount()) nickels worth $0.05
                \(describingPlayer.collection.dimeCount()) dimes worth $0.10
                \(describingPlayer.collection.quarterCount()) quarters worth $0.25
                \(describingPlayer.collection.loonieCount()) loonies worth $1.00
                \(describingPlayer.collection.toonieCount()) toonies worth $2.00
                """)
             waitForUserInput()
            print("\n====================================================================\n")
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
            print("""
                \(setupPlayer.name) moves 3 coins onto \(setupPlayer.playerGender.possessivePronoun) field. \(setupPlayer.playerGender.pronoun) places \(setupPlayer.field.stashDescription)
                """)
            waitForUserInput()
            print("\n====================================================================\n")
        }
    }
    
    mutating func playTurn() {
        
        //start of turn stats
        print("""
            
            It is \(currentTurnPlayer.name)'s turn. \(currentTurnPlayer.playerGender.pronoun) currently has \(currentTurnPlayer.field.collectionOfCoins.count) coins in \(currentTurnPlayer.playerGender.possessivePronoun) field and must roll \(currentTurnPlayer.diceToRoll()) dice.
            
            """)
        
        // Interactive mode, "press ENTER to roll the dice"
        waitForUserInput()
        
        if currentTurnPlayer.hasCoinsInField {
            
            //roll the dice and determine the outcome
            for _ in 1...currentTurnPlayer.diceToRoll() {
                let rolledSide = Dice.roll()
                
                switch rolledSide {
                case .dot:
                    print("\(currentTurnPlayer.name) rolled a '•'. Nothing happens!")
                    
                case .centre:
                    print("\(currentTurnPlayer.name) rolled a 'C'. \(currentTurnPlayer.playerGender.pronoun) gives up one coin to the centre! It's \(currentTurnPlayer.collection.collectionOfCoins[0].description).")
                    currentTurnPlayer.field.moveCoinsTo(destination: centrePot, howManyCoins: 1)
                    
                case .left:
                    print("\(currentTurnPlayer.name) rolled an 'L'. \(currentTurnPlayer.playerGender.pronoun) gives up one coin to \(players.getPlayerToTheLeft(of: currentTurnPlayer).name) on \(currentTurnPlayer.playerGender.possessivePronoun) left! It's \(currentTurnPlayer.collection.collectionOfCoins[0].description).")
                    currentTurnPlayer.field.moveCoinsTo(destination: players.getPlayerToTheLeft(of: currentTurnPlayer).field, howManyCoins: 1)
                    
                case .right:
                    print("\(currentTurnPlayer.name) rolled an 'R'. \(currentTurnPlayer.playerGender.pronoun) gives up one coin to \(players.getPlayerToTheRight(of: currentTurnPlayer).name) on \(currentTurnPlayer.playerGender.possessivePronoun) right! It's \(currentTurnPlayer.collection.collectionOfCoins[0].description).")
                    currentTurnPlayer.field.moveCoinsTo(destination: players.getPlayerToTheRight(of: currentTurnPlayer).field, howManyCoins: 1)
                default:
                    print("Something has gone wrong when rolling the die.")
                }
            }
            
        }
        
        print("\(currentTurnPlayer.name) now has \(currentTurnPlayer.field.collectionOfCoins.count) coins in \(currentTurnPlayer.playerGender.possessivePronoun) field.")
        addDevider()
        
        
        //check if you win
        var playersWithCoins : [Player] = []
        
        for checkingPlayer in players.group {
            if checkingPlayer.hasCoinsInField {
                playersWithCoins.append(checkingPlayer)
            }
        }
        
        //check if the list of players with coins only has one person in it, and if that player is you, you have won!
        if arrayOfPlayersContains(arrayToCheck: playersWithCoins, playerToCheckFor: currentTurnPlayer) && playersWithCoins.count == 1 {
            gameIsOngoing = false
        } else if playersWithCoins.count == 0 {
            gameIsOngoing = false
        }
        
        //pass the turn to the next player if current player did not just win
        if gameIsOngoing {
            passTurn()
        }
    }
    
    //static function to return a bool indicating whether a given array of players includes a given player
    func arrayOfPlayersContains(arrayToCheck: [Player], playerToCheckFor: Player) -> Bool {
        var doesItContain : Bool = false
        for checkingPlayer in arrayToCheck {
            if checkingPlayer === playerToCheckFor {
                doesItContain = true
            }
        }
        return doesItContain
    }
    
    //adds adevider to make things easier to read
    func addDevider() {
        print("\n====================================================================\n")
    }
    
    //print a series of statements about the winner
    func declareWinner(winner: Player) {
        
        //declare winning stats
        print("""
            \(winner.name) is the winner! \(winner.playerGender.pronoun) won the entire centre pot, which contains
            \(centrePot.nickleCount()) nickle(s) worth $0.05
            \(centrePot.dimeCount()) dime(s) worth $0.10
            \(centrePot.quarterCount()) quarter(s) worth $0.25
            \(centrePot.loonieCount()) loonie(s) worth $1.00
            \(centrePot.toonieCount()) toonie(s) worth $2.00
            """)
        
        //give winnings
        centrePot.moveAllContentsTo(destination: winner.collection)
        winner.field.moveAllContentsTo(destination: winner.collection)
        
        print("""
            \(winner.name) started with $\(winner.initialWealth), which means after taking the pot and the remaining coins on the field, \(winner.playerGender.pronoun) made a profit of $\(winner.collection.totalMonetaryValue - winner.initialWealth)!
         """)
    }
    
    func waitForUserInput() {
        
        if interactiveMode {
            print("Press ENTER to continue...", terminator: "")
            readLine()
        }
        
    }
    
}

//sample game

var Liam = Player(collection: Stash(initialCoins: Coin.poorCollection), name: "Liam", gender: .male)
var Taite = Player(collection: Stash(initialCoins: Coin.wealthyCollection), name: "Taite", gender: .female)
var Annika = Player(collection: Stash(initialCoins: Coin.standardCollection), name: "Annika", gender: .female)

var gooblyGame = LCRGame(whoIsPlaying: FriendGroup(group: [Liam, Annika, Taite]))

gooblyGame.playLCR()

