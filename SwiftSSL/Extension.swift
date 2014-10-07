//
//  Extension.swift
//  SwiftSSL
//
//  Created by 0day on 14/10/7.
//  Copyright (c) 2014年 SwiftP2P. All rights reserved.
//

import Foundation

/**
 * Index
 */
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
            for _ in 0..<digitIndex {
                decimalBase *= 10
            }
        return (self / decimalBase) % 10
    }
}

extension UInt {
    subscript(digitIndex: Int) -> UInt {
        var decimalBase:UInt = 1
            for _ in 0..<digitIndex {
                decimalBase *= 10
            }
            return (self / decimalBase) % 10
    }
}

extension UInt8 {
    subscript(digitIndex: Int) -> UInt8 {
        var decimalBase:UInt8 = 1
            for _ in 0...digitIndex {
                decimalBase *= 10
            }
            return (self / decimalBase) % 10
    }
}