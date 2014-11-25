// Copyright (c) 2014 Rex Recio
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//
//  CircularList.swift: 
//  A circular singly linked list intended as a base class for an
//  efficient implementation of Stack and Queue.  As such, it is an internal 
//  class not meant to be accessed by programs using this framework
//
//  Created by Rex Recio (rexrecio@gmail.com) on 10/28/14.
//


internal class CLnode<T> {
    var data: T
    var next: CLnode?
    
    init(_ data: T) {
        self.data = data
    }
    deinit {
        self.next = nil
        //println("Deallocating circular list data")
    }
}

internal class CircularList<T> {
    internal var tail: CLnode<T>?
    
    internal init() {
        tail = nil
    }
    
    deinit {
        
        var current: CLnode<T>?
        var temp:CLnode<T>
        if !isEmpty() {
            current = tail!.next!  /*Start at the head*/
            tail!.next = nil       /*Break the circular nature*/
            while current != nil {
                temp = current!
                current = current!.next
                temp.next = nil
                //println("De-allocating circular list node")
            }
            tail = nil;
            
        }
    }
    
    internal func isEmpty() -> Bool {
        return tail == nil ? true : false
        
    }
    
    //Insert element at the beginning of the list
    internal func insert(newData: T) {
        
        var newCLnode: CLnode<T> = CLnode(newData)
        
        if self.isEmpty() {
            newCLnode.next = newCLnode
            tail = newCLnode
        }
        else {
            newCLnode.next = tail!.next
            tail!.next = newCLnode
        }
    }
    
    //Delete the element at the beginning (head) of the list
    //and return the deleted element
    internal func remove() -> T? {
        
        var returnData:T
        
        if self.isEmpty() {
            return nil
        }
        var head: CLnode<T> = self.tail!.next!
        returnData = head.data
        
        if head === tail {
            //Only one CLnode
            tail = nil
        }
        else {
            //More than one CLnode
            tail!.next = head.next
        }
        
        return returnData
    }
    
    internal func count() -> Int {
        
        if isEmpty() {
            return 0
        }
        
        var cursor: CLnode<T>
        var count: Int = 0
        
        cursor = tail!
        do {
            count++
            cursor = cursor.next!
        }
        while cursor !== tail
        
        return count
    }
    
}