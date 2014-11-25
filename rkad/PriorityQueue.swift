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
//  PriorityQueue.swift:
//  An implementation of Priority Queue using a max heap.
//
//  Created by Rex Recio (rexrecio@gmail.com) on 10/28/14.
//

public class PriorityQueue<T:Comparable> : Heap<T> {
    public func remove() -> T? {
        //Remove the element with the highest priority,
        //this element is located in the root
        return super.remove(0)
    }
    
    //Returns the highest-priority element but does not modify the queue,
    public func findMax() -> T? {
        if isEmpty() {return nil}
        return array[0]
    }
}