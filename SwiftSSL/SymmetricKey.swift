//
//  SymmetricKey.swift
//  SwiftSSL
//
//  Created by 0day on 14/10/6.
//  Copyright (c) 2014年 SwiftP2P. All rights reserved.
//

import Foundation

public protocol SymmetricKey: Coding {
    func decryptCipher(cipher: NSData) -> (message: NSData?, error: NSError?)
    func encryptMessage(message: NSData) -> (cipher: NSData?, error: NSError?)
}