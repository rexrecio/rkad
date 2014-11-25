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
//  Stack.swift:
//  An implementation of a Stack using a circular singly linked list.
//
//  Created by Rex Recio (rexrecio@gmail.com) on 10/28/14.
//


public class Stack<T>: CircularList<T> {
    
    override public init() {
        super.init()
    }
    
    override public func isEmpty() -> Bool {
        return super.isEmpty()
    }
    
    override public func count() -> Int {
        return super.count()
    }
    
    public func push(newData: T) {
        insert(newData);
    }
    
    public func pop() -> T? {
        return remove()
    }
    
    public func top() -> T? {
        if isEmpty() {
            return nil
        }
        return tail!.next!.data
    }
    
}