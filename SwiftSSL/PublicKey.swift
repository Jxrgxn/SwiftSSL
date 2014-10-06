//
//  PublicKey.swift
//  SwiftSSL
//
//  Created by 0day on 14/10/6.
//  Copyright (c) 2014年 SwiftP2P. All rights reserved.
//

import Foundation

public protocol PublicKey: class, Coding {
    func encryptMessage(message: NSData) -> (cipher: NSData?, error: NSError?)
    func verifySignatureWithSHA128(signature: NSData, message: NSData) -> Bool
    func verifySignatureWithSHA256(signature: NSData, message: NSData) -> Bool
}