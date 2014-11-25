//
//  testStack.swift
//  rkad
//
//  Created by Rex Recio on 11/25/14.
//  Copyright (c) 2014 Rex Recio. All rights reserved.
//

import Cocoa
import XCTest
import rkad

class testStack: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsEmpty() {
        
        var s: Stack<String> = Stack()
        XCTAssertTrue(s.isEmpty(), "Stack is not empty")
        s.push("aardvark")
        XCTAssertFalse(s.isEmpty(), "Stack is empty")
    }
    
    func testCount() {
        
        var s: Stack<String> = Stack()
        s.push("aardvark"); s.push("bear");s.push("cheetah"); s.push("deer")
        XCTAssertEqual(s.count(), 4, "Wrong count!")
    }
    
    func testAddRemove() {
        var s: Stack<String> = Stack()
        s.push("aardvark"); s.push("bear");s.push("cheetah"); s.push("deer")
        var temp: String
        temp = s.pop()!
        XCTAssertEqual(temp, "deer", "Wrong item removed!")
        temp = s.pop()!
        XCTAssertEqual(temp, "cheetah", "Wrong item removed!")
        temp = s.pop()!
        XCTAssertEqual(temp, "bear", "Wrong item removed!")
        temp = s.pop()!
        XCTAssertEqual(temp, "aardvark", "Wrong item removed!")
        XCTAssertNil(s.pop(), "Error removing from empty Stack")
                
    }
    
    func testTop() {
        var s: Stack<String> = Stack()
        XCTAssertNil(s.top(), "Error geting the 'top' of an empty stack");
        s.push("aardvark"); s.push("bear");s.push("cheetah"); s.push("deer")
        var temp: String
        temp = s.top()!
        XCTAssertEqual(temp, "deer", "Wrong item at the top!")
        XCTAssertEqual(s.count(), 4, "Wrong count!")
    }
    
}
