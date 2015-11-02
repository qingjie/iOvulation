//
//  Int+Random.swift
//  iOvulation
//
//  Created by qingjiezhao on 7/27/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import Foundation

extension Int{
    /**
    Generates random number according to min and max
    
    - parameter min: number from which randomize
    - parameter max: number to randomize to
    - returns: random int
    */
    static func random(min: Int = min, max: Int = max) -> Int {
        return Int(arc4random_uniform(UInt32(max - min))) + min
    }
}