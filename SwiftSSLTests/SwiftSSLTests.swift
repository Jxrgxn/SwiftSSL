//
//  SwiftSSLTests.swift
//  SwiftSSLTests
//
//  Created by 0day on 14/10/6.
//  Copyright (c) 2014年 SwiftP2P. All rights reserved.
//

import XCTest
import SwiftSSL

let plainText = "The price of Bitcoin in Bitstamp is $377."
let key = "Halo"

class SwiftSSLTests: XCTestCase {
    // MARK: - Digest
    
    /**
     * Digest test case values based on: http://www.freeformatter.com/message-digest.html
     */
    func testDigest_MD2() {
        var digest = plainText.digest(SwiftSSL.DigestAlgorithm.MD2)
        
        XCTAssertEqual(digest, "4983db304a42f71b718172773ae3007c", digest)
    }
    
    func testDigest_MD4() {
        var digest = plainText.digest(SwiftSSL.DigestAlgorithm.MD4)
        
        XCTAssertEqual(digest, "625fb36e6d6afd9c5d469e4b493597e0", digest)
    }
    
    func testDigest_MD5() {
        var digest = plainText.digest(SwiftSSL.DigestAlgorithm.MD5)
        
        XCTAssertEqual(digest, "7cdc4ce8c27010381a3a004867df3b02", digest)
    }
    
    func testDigest_SHA1() {
        var digest = plainText.digest(SwiftSSL.DigestAlgorithm.SHA1)
        
        XCTAssertEqual(digest, "59d869d71f5b9d83694e3a907eab403aae390dc3", digest)
    }
    
    func testDigest_SHA224() {
        var digest = plainText.digest(SwiftSSL.DigestAlgorithm.SHA224)
        
        XCTAssertEqual(digest, "65e36e342247a388729a7b45e3d1b6c4399a0be64551c735ff2c1a96", digest)
    }
    
    func testDigest_SHA256() {
        var digest = plainText.digest(SwiftSSL.DigestAlgorithm.SHA256)
        
        XCTAssertEqual(digest, "5be9f958cd42d990cb7db2c9ec96fc6a1daa2c1a1aa9eebe5867dbb3c08689b3", digest)
    }
    
    func testDigest_SHA384() {
        var digest = plainText.digest(SwiftSSL.DigestAlgorithm.SHA384)
        
        XCTAssertEqual(digest, "cd9535621dfa2bce0e48522e0e28a3e67265c32525a2dd1c1ce4d8dd21b95b3852332aeddcdfadb126f00e96fa9ab2d6", digest)
    }
    
    func testDigest_SHA512() {
        var digest = plainText.digest(SwiftSSL.DigestAlgorithm.SHA512)
        
        XCTAssertEqual(digest, "9738b369b1e5156efeeb6a1a3c4b4d4054b64dd5052cee59343f8ce6b2a47effcd14e987b8b60ba95ab6436837b7da76108b1513ea05156f7b7632923e9127ac", digest)
    }
    
    // MARK: - HMAC
    
    /**
    * HMAC test case values based on: http://www.freeformatter.com/hmac-generator.html
    */
    func testHMAC_MD5() {
        var signature = plainText.sign(SwiftSSL.HMACAlgorithm.MD5, key: key)
        
        XCTAssertEqual(signature, "0f1c2d028d15623fc354210a99a156ce", signature)
    }
    
    func testHMAC_SHA1() {
        var signature = plainText.sign(SwiftSSL.HMACAlgorithm.SHA1, key: key)
        
        XCTAssertEqual(signature, "8ef67636f35195a00a6d6853cca4cac54c1fdb54", signature)
    }
    
    func testHMAC_SHA224() {
        var signature = plainText.sign(SwiftSSL.HMACAlgorithm.SHA224, key: key)
        
        XCTAssertEqual(signature, "c04b5da4f35a9fa854682c571c2e269552598237205822f87c30c23b", signature)
    }
    
    func testHMAC_SHA256() {
        var signature = plainText.sign(SwiftSSL.HMACAlgorithm.SHA256, key: key)
        
        XCTAssertEqual(signature, "9f840f1e69f0643d4cdffae2eceb2ac423190edc2cb7fd4d5c71663f06f8afae", signature)
    }
    
    func testHMAC_SHA384() {
        var signature = plainText.sign(SwiftSSL.HMACAlgorithm.SHA384, key: key)
        
        XCTAssertEqual(signature, "1f1fc00bfd35e25a544d4e7d8b31dad81d7720c2e48caf3f0f3d1e9b826520a2c332513fa8e7e5770e75d8e97dcfa9aa", signature)
    }
    
    func testHMAC_SHA512() {
        var signature = plainText.sign(SwiftSSL.HMACAlgorithm.SHA512, key: key)
        
        XCTAssertEqual(signature, "5ecdb692a3bf6ed1bbba83fa0ad0eaf6e0ac8be619ed3bac317e357c6efb083d95346c3ba258ebfb7e1f6cafbde4afccd6a25ddd50b8c57d4d7897c7b1670cc5", signature)
    }
}