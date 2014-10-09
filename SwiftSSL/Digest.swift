//
//  SHA.swift
//  SwiftSSL
//
//  Created by 0day on 14/10/7.
//  Copyright (c) 2014年 SwiftP2P. All rights reserved.
//

import Foundation
import CommonCrypto

public typealias DigestAlgorithmClosure = (data: UnsafePointer<UInt8>, dataLength: UInt32) -> [UInt8]

public enum DigestAlgorithm {
    case MD2, MD4, MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    
    func progressClosure() -> DigestAlgorithmClosure {
        var closure: DigestAlgorithmClosure?
        
        switch self {
        case .MD2:
            closure = {
                var hash = [UInt8](count: self.digestLength(), repeatedValue: 0)
                CC_MD2($0, $1, &hash);
                
                return hash
            }
        case .MD4:
            closure = {
                var hash = [UInt8](count: self.digestLength(), repeatedValue: 0)
                CC_MD4($0, $1, &hash);
                
                return hash
            }
        case .MD5:
            closure = {
                var hash = [UInt8](count: self.digestLength(), repeatedValue: 0)
                CC_MD5($0, $1, &hash);
                
                return hash
            }
        case .SHA1:
            closure = {
                var hash = [UInt8](count: self.digestLength(), repeatedValue: 0)
                CC_SHA1($0, $1, &hash);
                
                return hash
            }
        case .SHA224:
            closure = {
                var hash = [UInt8](count: self.digestLength(), repeatedValue: 0)
                CC_SHA224($0, $1, &hash);
                
                return hash
            }
        case .SHA384:
            closure = {
                var hash = [UInt8](count: self.digestLength(), repeatedValue: 0)
                CC_SHA384($0, $1, &hash);
                
                return hash
            }
        case .SHA512:
            closure = {
                var hash = [UInt8](count: self.digestLength(), repeatedValue: 0)
                CC_SHA512($0, $1, &hash);
                
                return hash
            }
        default:
            println("Holly SHIT!")
        }
        return closure!
    }
    
    func digestLength() -> Int {
        var result: CInt = 0
        switch self {
        case .MD2:
            result = CC_MD2_DIGEST_LENGTH
        case .MD4:
            result = CC_MD4_DIGEST_LENGTH
        case .MD5:
            result = CC_MD5_DIGEST_LENGTH
        case .SHA1:
            result = CC_SHA1_DIGEST_LENGTH
        case .SHA224:
            result = CC_SHA224_DIGEST_LENGTH
        case .SHA384:
            result = CC_SHA384_DIGEST_LENGTH
        case .SHA512:
            result = CC_SHA512_DIGEST_LENGTH
        default:
            println("Holly SHIT!")
        }
        return Int(result)
    }
}

extension String {
    public func digest(algorithm: DigestAlgorithm) -> String {
        var data = self.dataUsingEncoding(NSUTF8StringEncoding)
        return data!.digest(algorithm)
    }
}

extension NSData {
    public func digest(algorithm: DigestAlgorithm) -> String {
        let string = UnsafePointer<UInt8>(self.bytes)
        let stringLength = UInt32(self.length)
        let digestLength = algorithm.digestLength()
        
        var closure = algorithm.progressClosure()
        
        var hash = closure(data: string, dataLength: stringLength)
        
        var resultData = NSData(bytes: hash, length: digestLength)
        var resultString: String = NSString(data: resultData, encoding: NSUTF8StringEncoding)
        
        return resultString
    }
}