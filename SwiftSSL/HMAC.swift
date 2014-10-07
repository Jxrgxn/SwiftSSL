//
//  SHA.swift
//  SwiftSSL
//
//  Created by 0day on 14/10/6.
//  Copyright (c) 2014年 SwiftP2P. All rights reserved.
//

import Foundation
import CommonCrypto

/**
 * Reference: http://stackoverflow.com/a/24411522/313633
 */

enum HMACAlgorithm {
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

/**
 * SHA256
 */
extension NSData {
    public func SHA256Digest() -> NSData {
        let digestLength = HMACAlgorithm.SHA256.digestLength()
        var hash = [UInt8](count: digestLength, repeatedValue: 0)
        
        CC_SHA256(self.bytes, UInt32(self.length), &hash)
        
        return NSData(bytes: hash, length: digestLength)
    }
    
    public func SHA256HexStringDigest() -> String {
        
    }
    
    public func hexStringValue() -> String {
        let sha256description = self.description as String
        
        // TODO: more elegant way to convert NSData to a hex string
        
        var result: String = ""
        
        for char in sha256description {
            switch char {
            case "0", "1", "2", "3", "4", "5", "6", "7","8","9", "a", "b", "c", "d", "e", "f":
                result.append(char)
            default:
                result += ""
            }
        }
        
        return result
    }
}

extension String {
    public func dataValueFromThisHexString() -> NSData {
        // Based on: http://stackoverflow.com/a/2505561/313633
        var data = NSMutableData()
        
        var string = ""
        
        for char in self {
            string.append(char)
            if(countElements(string) == 2) {
                let scanner = NSScanner(string: string)
                var value: CUnsignedInt = 0
                scanner.scanHexInt(&value)
                data.appendBytes(&value, length: 1)
                string = ""
            }
            
        }
        
        return data as NSData
    }
}