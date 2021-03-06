//
//  Stash.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-03-11.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

//structure for a collection of coins
class Stash {
    
    //the array of coins that is contained in the stash
    var collectionOfCoins : [Coin]
    
    //initializer
    init(initialCoins: [Coin]) {
        self.collectionOfCoins = initialCoins
    }
    
    //returns the total value of all coins in the stash
    var totalMonetaryValue : Double {
        var total = 0.0
        for moneyValue in collectionOfCoins {
            total += moneyValue.value
        }
        return total
    }
    
    
    //returns a description of each coin in the stash
    var stashDescription : String {
        var description = "\n"
        for coin in collectionOfCoins {
            description += coin.description
            description += "\n"
        }
        
        description += "Total worth: $\(totalMonetaryValue) \n"
        
        return description
    }
    
    // Functions to check amount of coins for specific type
    func nickleCount() -> Int {
        var numberOfNickels = 0
        let coinArray = collectionOfCoins
        for index in coinArray {
            if index == LeftCentreRight.Coin.nickel {
                numberOfNickels += 1
            }
        }
        return numberOfNickels
    }
    
    func dimeCount() -> Int {
        var numberOfDimes = 0
        let coinArray = collectionOfCoins
        for index in coinArray {
            if index == LeftCentreRight.Coin.dime {
                numberOfDimes += 1
            }
        }
        return numberOfDimes
    }
    
    func quarterCount() -> Int {
        var numberOfQuarters = 0
        let coinArray = collectionOfCoins
        for index in coinArray {
            if index == LeftCentreRight.Coin.quarter {
                numberOfQuarters += 1
            }
        }
        return numberOfQuarters
    }
    
    func loonieCount() -> Int {
        var numberOfloonies = 0
        let coinArray = collectionOfCoins
        for index in coinArray {
            if index == LeftCentreRight.Coin.loonie {
                numberOfloonies += 1
            }
        }
        return numberOfloonies
    }
    
    func toonieCount() -> Int {
        var numberOfToonies = 0
        let coinArray = collectionOfCoins
        for index in coinArray {
            if index == LeftCentreRight.Coin.toonie {
                numberOfToonies += 1
            }
        }
        return numberOfToonies
    }
    
    //check if this stash has more coins than another
    func isMoreFullThan(_ otherStash: Stash) -> Bool {
        return self.collectionOfCoins.count > otherStash.collectionOfCoins.count
    }
    
    //check if this stash is worth more than another
    func isWorthMoreThan(_ otherStash: Stash) -> Bool {
        return self.totalMonetaryValue > otherStash.totalMonetaryValue
    }
    
    //a function to sort what stash, out of any number, is worth most
    static func WorthMost(outOf bunchOfStashes: [Stash]) -> Stash {
        var biggest : Stash = bunchOfStashes[0]
        for stash in bunchOfStashes {
            if stash.totalMonetaryValue > biggest.totalMonetaryValue {
                biggest = stash
            }
        }
        return biggest
    }
    
    //function to move all coins in a stash to another stash
    func moveAllContentsTo(destination: Stash) {
        destination.collectionOfCoins.append(contentsOf: self.collectionOfCoins)
        self.collectionOfCoins.removeAll()
    }
    
    //function to move designated coins to another stash
    func moveCoinsTo(destination: Stash, howManyCoins: Int) {
        
        //create a variable to help keep track of whether the first stash still has enough coins to give to the second
        var coinsLeftToMove = howManyCoins
        
        //loop the number of times needed to move all coins
        for _ in 1...howManyCoins {
            
            if collectionOfCoins.count >= coinsLeftToMove {
                //give the coins
                destination.collectionOfCoins.append(self.collectionOfCoins.first!)
                
                //remove the coins
                self.collectionOfCoins.removeFirst()
                
                //decrease the coins left to give
                coinsLeftToMove -= 1
            } else {
                //if the stash no longer has coins to give
                print("Initial stash has run out of coins.")
            }
        }
    }
    
    //function that rearranges the contents of a stash in a random order
    func randomizeCoins() {
        for _ in 1...(self.collectionOfCoins.count * 20) {
            
            //only run if there is more than 1 coin in the stash
            if self.collectionOfCoins.count > 1 {
                self.collectionOfCoins.insert(self.collectionOfCoins[0], at: Int.random(in: 1...self.collectionOfCoins.count))
                self.collectionOfCoins.remove(at: 0)
            }
        }
    }
    
}
