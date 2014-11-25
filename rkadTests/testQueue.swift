//
//  testQueue.swift
//  rkad
//
//  Created by Rex Recio on 11/25/14.
//  Copyright (c) 2014 Rex Recio. All rights reserved.
//

import Cocoa
import XCTest
import rkad

class testQueue: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsEmpty() {
        
        var q: Queue<String> = Queue()
        XCTAssertTrue(q.isEmpty(), "Queue is not empty")
        q.add("aardvark")
        XCTAssertFalse(q.isEmpty(), "Queue is empty")
    }
    
    func testCount() {
        
        var q: Queue<String> = Queue()
        q.add("aardvark"); q.add("bear");q.add("cheetah"); q.add("deer")
        XCTAssertEqual(q.count(), 4, "Wrong count!")
    }
    
    func testAddRemove() {
        var q: Queue<String> = Queue()
        q.add("aardvark"); q.add("bear");q.add("cheetah"); q.add("deer")
        var temp: String
        temp = q.remove()!
        XCTAssertEqual(temp, "aardvark", "Wrong item removed!")
        temp = q.remove()!
        XCTAssertEqual(temp, "bear", "Wrong item removed!")
        temp = q.remove()!
        XCTAssertEqual(temp, "cheetah", "Wrong item removed!")
        temp = q.remove()!
        XCTAssertEqual(temp, "deer", "Wrong item removed!")
        XCTAssertNil(q.remove(), "Error removing from empty queue")
                
    }
    

}
