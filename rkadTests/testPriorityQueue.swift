//
//  testPriorityQueue.swift
//  rkad
//
//  Created by Rex Recio on 11/25/14.
//  Copyright (c) 2014 Rex Recio. All rights reserved.
//

import Cocoa
import XCTest
import rkad

class testPriorityQueue: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsEmpty() {
        
        var pq: PriorityQueue<String> = PriorityQueue(128)
        XCTAssertTrue(pq.isEmpty(), "Queue is not empty")
        pq.add("aardvark")
        XCTAssertFalse(pq.isEmpty(), "Queue is empty")
    }
    
    func testCount() {
        
        var pq: PriorityQueue<String> = PriorityQueue()
        pq.add("cheetah"); pq.add("deer"); pq.add("aardvark"); pq.add("bear")
        XCTAssertEqual(pq.count(), 4, "Wrong count!")
    }
    
    func testAddRemove() {
        var pq: PriorityQueue<String> = PriorityQueue()
        pq.add("cheetah"); pq.add("deer"); pq.add("aardvark"); pq.add("bear");
        var temp: String
        temp = pq.remove()!
        XCTAssertEqual(temp, "deer", "Wrong item removed!")
        temp = pq.remove()!
        XCTAssertEqual(temp, "cheetah", "Wrong item removed!")
        temp = pq.remove()!
        XCTAssertEqual(temp, "bear", "Wrong item removed!")
        temp = pq.remove()!
        XCTAssertEqual(temp, "aardvark", "Wrong item removed!")
        XCTAssertNil(pq.remove(), "Error removing from empty queue")
                
    }
    

}
