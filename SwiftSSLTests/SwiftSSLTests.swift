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
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testHMAC_MD5() {
        var planText: String = "This is MD5 test."
        var signature = planText.sign(SwiftSSL.HMACAlgorithm.MD5, key: "Halo")
        println("\(signature)")
        
        XCTAssertEqual(signature, "391b07919974622fe55a7f3dea276f83", signature)
    }
}
