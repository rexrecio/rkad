//
//  LinkedList.swift
//  HelloSwift
//
//  Created by Rex Recio on 11/6/14.
//  Copyright (c) 2014 Rex Recio. All rights reserved.
//


public class LinkedList<T:Comparable>: CircularList<T> {
    override public func isEmpty() -> Bool {
        return super.isEmpty()
    }
    
    //Insert element at the beginning of the list
    override public func insert(newData: T) {
        super.insert(newData)
    }
    
    public func reverse() {
        var p, q, r, head: CLnode<T>
        
        if self.isEmpty() {
            return
        }
        q = tail!
        head = tail!.next!; p = head
        do {
            r = q
            q = p
            p = q.next!
            q.next = r
        }
            while p !== head
        tail = head
    }
    public override func count() -> Int {
        var cursor: CLnode<T>
        var count: Int
        
        if self.isEmpty() {
            return 0
        }
        
        count = 0
        cursor = self.tail!
        do {
            count++
            cursor = cursor.next!
        }
            while cursor !== self.tail
        
        return count
        
    }

    
    public class func merge(a: LinkedList<T>, _ b:LinkedList<T>) -> LinkedList<T> {
        if (b.isEmpty()) {
            return a
        }
        if (a.isEmpty()) {
            a.tail = b.tail
            b.tail = nil
        }
        var head: CLnode = a.tail!.next!
        a.tail!.next = b.tail!.next!
        b.tail!.next = head
        a.tail = b.tail
        b.tail = nil;  /*Empty the second list after the merger*/
        
        return a       /*Retain the first list, which now contains the elements of the combined lists*/
    }
    
    public func find (key: T) -> T? {
        var current, head : CLnode<T>
        
        if self.isEmpty() {
            return nil
        }
        
       
        head = tail!.next!
        current = head            /*begin current at the head of the list*/
        do {
            if (current.data == key) {
                return current.data
            }
            current = current.next!
        }
        while (current !== head)  /*end when you return to the head*/
        
        return nil
    }
    
    /*Find an element and put it at the head of the list*/
    public func findAdj (key: T) -> T? {
        var data: T?
        
        data = remove(key)
        if (data != nil) {
            insert(data!)
        }
        
        return data?
    }
    
    public func remove (key: T) -> T? {

        var current, head, prev: CLnode<T>
        var data: T
        
        if self.isEmpty() {
            return nil
        }
        head = tail!.next!
        
        prev = tail!
        current = head          /*begin current at the head of the list*/
        do {
            if (current.data == key) {
                if (current === prev) { /*only node*/
                    tail = nil
                }
                else {
                    prev.next = current.next  /*unlink the node to be deleted*/
                    if current === tail {     /*last node is to be deleted*/
                        tail = prev
                    }
                }
                data = current.data
        
                return data
            }
            prev = current
            current = current.next!
        }
        while (current !== head)  /*end when you return to the head*/
        
        return nil
    }
    
    public func traverse<U>(userFunction: (T, U?) -> Bool, _ userInput: U? ) -> Bool {
        var current, head: CLnode<T>
        
        if self.isEmpty() {
            return false
        }
        
        head = tail!.next!
        current = head
        do
        {
            if ( !userFunction(current.data, userInput?) ) {
                return false
            }
            current = current.next!;
        }
            while current !== head;
        
        return true;
    }
}