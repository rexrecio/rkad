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
//  Deque.swift:
//  An implementation of deque using a doubly linked list.
//
//  Created by Rex Recio (rexrecio@gmail.com) on 10/28/14.
//


internal class DLnode<T> {
    var data: T
    var next, prev: DLnode?
    
    init(_ data: T) {
        self.data = data
        self.next = self
        self.prev = self
    }
    deinit {
        self.next = nil
        self.prev = nil
        println("De-initializing deque node")
    }
    
}
public class Deque<T> {
    internal var tail: DLnode<T>?
    
    public init() {
        tail = nil
    }
    
    deinit {
        if tail == nil {
            return
        }
        
        var current: DLnode<T>?
        var temp: DLnode<T>?
        
        current = tail!.next         /*current starts with the head*/
        tail!.next = nil;            /*break the circular nature*/
        
        do {
            temp = current
            current = current!.next
            temp!.next = nil; temp!.prev = nil
            println("Deinitializing deque...")
        }
        while (current != nil)
        tail = nil
    }
    
    public func isEmpty() -> Bool {
        return tail == nil ? true : false
    }
    
    internal func insertAfter(var node: DLnode<T>, var _ newNode: DLnode<T>) {
        newNode.next = node.next
        newNode.prev = node
        node.next!.prev = newNode
        node.next = newNode
    }
    
    internal func insertBefore(var node: DLnode<T>, var _ newNode: DLnode<T>) {
        insertAfter(node.prev!, newNode)
    }
    
    internal func remove(var node: DLnode<T>) ->T {
        var data: T
        
        if (node.next === node) {
            tail = nil
        }
        else {
            node.next!.prev = node.prev
            node.prev!.next = node.next
            if (node===tail) {
                tail = node.prev
            }
            
        }
        data = node.data
        node.next = nil; node.prev=nil         /*Free the node, i.e., remove the reference*/
        
        return data
        
    }
    
    public func pushFront(data: T) {
        var newNode : DLnode<T> = DLnode(data)
        
        if isEmpty() {
            tail = newNode
        }
        else {
            insertAfter(tail!, newNode)
        }
    }
    
    public func pushBack (data: T) {
        pushFront(data)
        tail = tail!.next;
    }
    
    public func popFront () -> T? {
        var data: T?
        
        if isEmpty() {
            return nil
        }
        else {
            data = remove(tail!.next!)
            return data
        }
        
    }
    
    public func popBack () -> T? {
        var data: T?
        
        if isEmpty() {
            return nil
        }
        else {
            data = remove(tail!)
            return data
        }
        
    }
    
    public func front() -> T? {
        return tail == nil ? nil : tail!.next!.data
    }
    
    public func back() -> T? {
        return tail == nil ? nil : tail!.data
    }
}
