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
//  Heap.swift:
//  Heap (max heap) data structure implementation.  A heap is
//  an ordered, balanced binary tree in which the value of the node at the
//  root of any subtree is greater than or equal to the value of either of
//  its children.  This implementation uses an array.
//
//  Created by Rex Recio (rexrecio@gmail.com) on 10/28/14.
//

public class Heap<T:Comparable> {
    internal var array: Array<T> = []
    internal var nextelement, heapsize: Int
    
    public init () {
        nextelement = 0
        heapsize = 0
        array = []
    }
    
    public convenience init (_ size: Int) {
        self.init()
        array.reserveCapacity(size)
    }
    
    public func isEmpty() -> Bool {
        return nextelement == 0 ? true : false
    }
    
    public func add(data: T) {
        if nextelement == heapsize {
            heapsize++
        }
        if nextelement == array.count {
            array.append(data)
        }
        else {
            array[nextelement] = data
        }
        siftup(nextelement)
        nextelement++
    }
    
    public func remove(element: Int) -> T? {
        if element >= nextelement {
            return nil
        }
        var deletedData: T
        deletedData = array[element]
        nextelement--
        if element != nextelement {
            array[element] = array[nextelement]
            siftdown(element)
        }
        
        return deletedData
    }
    
    private func siftup (element: Int) {
        var parent: Int
        var temp: T
        
        if (element == 0) {
            return
        }
            
        parent = (element - 1) / 2
        if (array[element] <= array[parent]) {
            return
        }
            
        temp = array[element]
        array[element] = array[parent]
        array[parent] = temp
        
        siftup(parent)
    }
    
    private func siftdown (parent: Int) {
        var leftChild, rightChild, swapElement: Int
        var temp: T
        
        leftChild = 2 * parent + 1
        rightChild = leftChild + 1
        
        /*if no children*/
        if (leftChild >= nextelement) {
            return
        }
        
        /*if no right child*/
        if (rightChild >= nextelement) {
            if (array[parent] < array[leftChild]) {
                temp = array[parent]
                array[parent] = array[leftChild]
                array[leftChild] = temp
            }
            return
        }
        /*Two children, swap the parent with the bigger child*/
        if (array[parent] < array[leftChild] || array[parent] < array[rightChild]) {
            swapElement = array[leftChild] > array[rightChild] ? leftChild : rightChild
            temp = array[parent]
            array[parent] = array[swapElement]
            array[swapElement] = temp
            
            siftdown(swapElement)
        }
    }
}

