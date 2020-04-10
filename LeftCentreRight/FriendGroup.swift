//
//  FriendGroup.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-04-09.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

struct FriendGroup {
    
    var group : [Player]
    
    //computed value to determine the richest player in the group
    var mostWealthyPlayer : Player {
        var richest = group[1]
        
        for potentiallyRichPlayer in group {
            if potentiallyRichPlayer.collection.totalMonetaryValue > richest.collection.totalMonetaryValue {
                richest = potentiallyRichPlayer
            }
        }
        return richest
    }
    
    //computed value to determine the poorest player in the group
    var mostPoorPlayer : Player {
        var poorest = group[1]
        
        for potentiallyRichPlayer in group {
            if potentiallyRichPlayer.collection.totalMonetaryValue < poorest.collection.totalMonetaryValue {
                poorest = potentiallyRichPlayer
            }
        }
        return poorest
    }
    
    var namesOfAllPlayers : String {
        var description = ""
        
        for i in 1...group.count {
            description += "\(group[i].name)"
            if i < (group.count - 1) {
                description += ", "
            } else if i == (group.count - 1) {
                description += ", and "
            }
        }
        return description
    }
    
    //function to find the index of a player to locate them at the table
    func findIndexOfPlayer(targetPlayer: Player) -> Int {
        var foundPlayerIndex : Int = 0
        for i in 0...(group.count - 1) {
            if group[i] === targetPlayer {
                foundPlayerIndex = i
            }
        }
        return foundPlayerIndex
    }
    
    //function to return a reference to the player on the right of specified player
    func getPlayerToTheRight(of basePlayer: Player) -> Player {
        
        var index : Int
        
        if findIndexOfPlayer(targetPlayer: basePlayer) == group.count - 1 {
            index = 0
        } else {
            index = findIndexOfPlayer(targetPlayer: basePlayer) + 1
        }
        var playerToTheRight = group[index]
        return playerToTheRight
    }
    
    //function to return the player on the left
    func getPlayerToTheLeft(of basePlayer: Player) -> Player {
        
        var index : Int
        
        if findIndexOfPlayer(targetPlayer: basePlayer) == 0 {
            index = group.count - 1
        } else {
            index = findIndexOfPlayer(targetPlayer: basePlayer) - 1
        }
        var playerToTheLeft = group[index]
        return playerToTheLeft
    }
    
}
