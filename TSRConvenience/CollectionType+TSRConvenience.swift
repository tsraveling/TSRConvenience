//
//  CollectionType+TSRConvenience.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/27/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import UIKit

// The following courtesy of Nate Cook on Stack Overflow: http://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift

extension Collection {
    
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollection where Index == Int {
    
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0 ..< count.toIntMax() - 1 {
            let j = Int(arc4random_uniform(UInt32(count.toIntMax() - i))) + i
            guard i != j else { continue }
            
            var a = self[Int(i)]
            var b = self[Int(j)]
            
            swap(&a, &b)
        }
    }
}
