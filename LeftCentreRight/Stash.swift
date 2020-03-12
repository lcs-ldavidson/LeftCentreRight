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
        var description = ""
        for coin in collectionOfCoins {
            description += coin.description
        }
        return description
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
    
}
