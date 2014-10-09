//
//  SwiftSSLTests.swift
//  SwiftSSLTests
//
//  Created by 0day on 14/10/6.
//  Copyright (c) 2014年 SwiftP2P. All rights reserved.
//

import XCTest
import SwiftSSL

class SwiftSSLTests: XCTestCase {
    // MARK: - HMAC
    
    /**
    * HMAC test case values based on: http://www.freeformatter.com/hmac-generator.html
    */
    func testHMAC_MD5() {
        var planText: String = "This is MD5 test. If you wanna help me to make this better, you can send me BTSX to dayzh. :]"
        var signature = planText.sign(SwiftSSL.HMACAlgorithm.MD5, key: "Halo")
        
        XCTAssertEqual(signature, "92b04e0b410792461b9a06ad1d4d9b12", signature)
    }
    
    func testHMAC_SHA1() {
        var planText: String = "This is SHA1 test. If you wanna help me to make this better, you can send me BTSX to dayzh. :]"
        var signature = planText.sign(SwiftSSL.HMACAlgorithm.SHA1, key: "Halo")
        
        XCTAssertEqual(signature, "92d580f62309cacf5d26c2e954d3a3f0c7f2878a", signature)
    }
    
    func testHMAC_SHA224() {
        var planText: String = "This is SHA224 test. If you wanna help me to make this better, you can send me BTSX to dayzh. :]"
        var signature = planText.sign(SwiftSSL.HMACAlgorithm.SHA224, key: "Halo")
        
        XCTAssertEqual(signature, "86cafaea0d3085c467de42660fa777427117d616ed9f6d5d0b36ce62", signature)
    }
    
    func testHMAC_SHA256() {
        var planText: String = "This is SHA256 test. If you wanna help me to make this better, you can send me BTSX to dayzh. :]"
        var signature = planText.sign(SwiftSSL.HMACAlgorithm.SHA256, key: "Halo")
        
        XCTAssertEqual(signature, "b27f8f1e943e3dcb274c4d110f59dc131a9d602fbacc3367155e1d629c3c4656", signature)
    }
    
    func testHMAC_SHA384() {
        var planText: String = "This is SHA384 test. If you wanna help me to make this better, you can send me BTSX to dayzh. :]"
        var signature = planText.sign(SwiftSSL.HMACAlgorithm.SHA384, key: "Halo")
        
        XCTAssertEqual(signature, "7d096c0bc916baaf272333b2b84b7ed9b8505d20bf350dbcd57d1eaa22f60b53fd9b7af24a087cc331eea1559318d56d", signature)
    }
    
    func testHMAC_SHA512() {
        var planText: String = "This is SHA512 test. If you wanna help me to make this better, you can send me BTSX to dayzh. :]"
        var signature = planText.sign(SwiftSSL.HMACAlgorithm.SHA512, key: "Halo")
        
        XCTAssertEqual(signature, "12c6eb3509e830d33f14c0812784b83a3c123015eb4f4950adc9340ab096adf9c85e96264a401b333d4567203f4fbe80d36d5b3c80b9fa90a51248ff8d7d8046", signature)
    }
}