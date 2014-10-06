//
//  PrivateKey.swift
//  SwiftSSL
//
//  Created by 0day on 14/10/6.
//  Copyright (c) 2014年 SwiftP2P. All rights reserved.
//

import Foundation

public protocol PrivateKey: Coding {
    func decryptCipher(cipher: NSData) -> (message: NSData?, error: NSError?)
    func signWithSHA128(message: NSData) -> (signature: NSData?, error: NSError?)
}