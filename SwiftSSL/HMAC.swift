//
//  SHA.swift
//  SwiftSSL
//
//  Created by 0day on 14/10/6.
//  Copyright (c) 2014年 SwiftP2P. All rights reserved.
//

import Foundation
import CommonCrypto

// Base: http://stackoverflow.com/a/24411522/313633
public enum HMACAlgorithm {
    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    
    func toCCEnum() -> CCHmacAlgorithm {
        var result: Int = 0
        switch self {
        case .MD5:
            result = kCCHmacAlgMD5
        case .SHA1:
            result = kCCHmacAlgSHA1
        case .SHA224:
            result = kCCHmacAlgSHA224
        case .SHA256:
            result = kCCHmacAlgSHA256
        case .SHA384:
            result = kCCHmacAlgSHA384
        case .SHA512:
            result = kCCHmacAlgSHA512
        }
        return CCHmacAlgorithm(result)
    }
    
    func digestLength() -> Int {
        var result: CInt = 0
        switch self {
        case .MD5:
            result = CC_MD5_DIGEST_LENGTH
        case .SHA1:
            result = CC_SHA1_DIGEST_LENGTH
        case .SHA224:
            result = CC_SHA224_DIGEST_LENGTH
        case .SHA256:
            result = CC_SHA256_DIGEST_LENGTH
        case .SHA384:
            result = CC_SHA384_DIGEST_LENGTH
        case .SHA512:
            result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}

extension String {
    public func sign(algorithm: HMACAlgorithm, key: String) -> String {
        let string = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let stringLength = UInt(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLength = algorithm.digestLength()
        let keyString = key.cStringUsingEncoding(NSUTF8StringEncoding)
        let keyLength = UInt(key.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        var result: CUnsignedChar = 0
        
        CCHmac(algorithm.toCCEnum(), keyString!, keyLength, string!, stringLength, &result)
        
        var hash: String = ""
        for i in 0..<digestLength {
            hash += String(format: "%02x", result[i])
        }
        
        return hash
    }
}

extension NSData {
    public func sign(algorithm: HMACAlgorithm, key: String) -> String {
        var string: String = NSString(data: self, encoding: NSUTF8StringEncoding)
        return string.sign(algorithm, key: key)
    }
}
