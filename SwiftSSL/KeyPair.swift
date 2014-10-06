//
//  KeyPair.swift
//  SwiftSSL
//
//  Created by 0day on 14/10/6.
//  Copyright (c) 2014年 SwiftP2P. All rights reserved.
//

import Foundation

let codingPrivateKey = "KeyPair.privateKey"
let codingPublicKey = "KeyPair.publicKey"

public class KeyPair: NSObject, NSCoding, NSCopying {
    public var privateKey: PrivateKey
    public var publicKey: PublicKey
    
    public required init(coder aDecoder: NSCoder) {
        self.privateKey = aDecoder.decodeObjectForKey(codingPrivateKey) as PrivateKey!
    }
    public override init() {
        super.init()
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.privateKey, forKey: codingPrivateKey)
        aCoder.encodeObject(self.publicKey, forKey: codingPublicKey)
    }
    
    public func copyWithZone(zone: NSZone) -> AnyObject {
        var copy = KeyPair()
        copy.privateKey = self.privateKey
        copy.publicKey = self.publicKey
        
        return copy
    }
}