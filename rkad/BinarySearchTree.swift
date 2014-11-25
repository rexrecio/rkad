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
//  BinarySearchTree.swift:
//  An implementation of a binary search tree.  It uses root insertion
//
//  Created by Rex Recio (rexrecio@gmail.com) on 10/28/14.
//

internal class BSTnode<T:Comparable> {
    var data: T
    var left, right: BSTnode?
    
    init(_ data: T) {
        self.data = data
    }
    /*deinit {
        println("De-allocating actual data")
    }*/
}

public class BinarySearchTree<T:Comparable> {
    
    public class var PREORDER: Int {
        return 0
    }
    public class var INORDER: Int {
        return 1
    }
    public class var POSTORDER: Int {
        return 2
    }
    
    var root: BSTnode<T>?
    
    public init () {
        root = nil
    }
    
    deinit {
        free(root)
    }
    
    private func free (var node: BSTnode<T>?) {
        if(node != nil) {
            free(node!.left)
            free(node!.right)
            node = nil
            println("De-allocating tree node")
        }
    }
    
    
    public func isEmpty() -> Bool {
        return root == nil
    }
    
    public func add(newData: T) {
        if isEmpty() {
            root = BSTnode(newData)
        }
        else {
            root = _add(root!, newData)
        }
    }
    
    private func _add(var currentBSTnode: BSTnode<T>?, _ newData: T) -> BSTnode<T> {
        
        if currentBSTnode == nil {
            var newBSTnode: BSTnode<T> = BSTnode(newData)
            currentBSTnode = newBSTnode
            
            return currentBSTnode!
        }
        if (newData < currentBSTnode!.data) {
            currentBSTnode!.left = _add((currentBSTnode!).left?, newData)
            currentBSTnode = _rotate_right(currentBSTnode!)
        }
        else {
            currentBSTnode!.right = _add((currentBSTnode!).right?, newData)
            currentBSTnode = _rotate_left(currentBSTnode!)
        }
        
        return currentBSTnode!
    }
    
    private func _rotate_right (var node: BSTnode<T>) -> BSTnode<T> {
        
        var temp: BSTnode<T>
        
        /*Make the old parent the right child of the new parent*/
        /*The new parent is the old left child of the old parent*/
        temp = node.left!
        node.left = temp.right
        temp.right = node
        
        return temp
        
    }
    
    private func _rotate_left (var node: BSTnode<T>) -> BSTnode<T> {
        
        var temp: BSTnode<T>
        
        /*The new parent is the old right child of the old parent*/
        /*Make the old parent the left child of the old parent*/
        temp = node.right!
        node.right = temp.left
        temp.left = node
        
        return temp
        
    }
    
    public func traverse<U>(order: Int, _ userFunction: (T, U) -> (), _ userInput: U ) {
    
        return _traverse(root, order, userFunction, userInput)
    }
    
    private func _traverse<U>(node: BSTnode<T>?, _ order: Int,
        _ userFunction:(T, U) -> (), _ userInput: U )  {
        
        if node == nil {
            return
        }
        
        if (order == BinarySearchTree.PREORDER) {
            userFunction(node!.data, userInput)
            _traverse (node!.left, order, userFunction, userInput)
            _traverse (node!.right, order, userFunction, userInput)
            
        }
        else if (order == BinarySearchTree.INORDER) {
            _traverse (node!.left, order, userFunction, userInput)
            userFunction(node!.data, userInput)
            _traverse (node!.right, order, userFunction, userInput)
        }
        else if (order == BinarySearchTree.POSTORDER) {
            _traverse (node!.left, order, userFunction, userInput)
            _traverse (node!.right, order, userFunction, userInput)
            userFunction(node!.data, userInput)
        }
            
    }
    
    private func _find(currentNode: BSTnode<T>?, _ key:T) -> BSTnode<T>? {
        
        if currentNode == nil {
            return nil
        }
        else if (key < currentNode!.data) {
            return _find (currentNode!.left, key)
        }
        else if (key > currentNode!.data) {
            return _find (currentNode!.right, key)
        }
        else {
            return currentNode
        }
    }
    
    public func find (key: T) -> T? {
        
        var node: BSTnode<T>?
        
        node = _find (root, key)
        if (node == nil) {
            return nil
        }
        else {
            return node!.data
        }        
    }
    
    public func count() -> Int {
        return _count(root)
    }
    
    private func _count(node: BSTnode<T>?) -> Int {
        if node == nil {
            return 0
        }
        return _count(node!.left?) + _count(node!.right?) + 1
    }
    
    public func height() -> Int {
        return _height(root)
    }
    
    private func _height(node: BSTnode<T>?) -> Int {
        if node == nil {
            return 0
        }
        var leftHeight: Int = _height(node!.left?)
        var rightHeight: Int = _height(node!.right?)
        
        return (leftHeight > rightHeight ? leftHeight : rightHeight) + 1
    }
    
    public func deleteXX (key: T) -> T? {
        var node: BSTnode<T>?
        var data: T?
        
        node = _delete(root, key)
        /*if there's only 1 node and it is the one to be deleted*/
        if (root!.left == nil && root!.right == nil && key == root!.data) {
            root = nil
        }
        node!.left = nil;  node!.right = nil; node = nil
        
        return data
    }
    
    private func _delete(var currentNode: BSTnode<T>?, _ key : T) -> BSTnode<T>? {
        var tempNode : BSTnode<T>
        var child: BSTnode<T>?
        var data: T?
        
        if currentNode == nil {
            data = nil
            return nil  /*node not found*/
        }
        
        if key < currentNode!.data {
            currentNode!.left = _delete (currentNode?.left, key)
        }
        else if key > currentNode!.data {
            currentNode!.right = _delete(currentNode?.right, key)
        }
        /*Two children*/
        else if currentNode!.right != nil && currentNode!.left != nil {
            
            data = currentNode!.data
            
            /*only one node in the right subtree*/
            if (currentNode!.right!.left == nil) { //Case 2: |p|'s right child has no left child*/
                /*swap the contents of the current node and right child*/
                tempNode = currentNode!.right!
                currentNode!.data = tempNode.data
                currentNode!.right = currentNode!.right!.right  /*Unlink*/
            }
            else {
                tempNode  = _deleteMin (currentNode!.right!)  //Case 3: |p|'s right child has a left child
                currentNode!.data = tempNode.data
            }
            tempNode.left = nil; tempNode.right = nil      /*Free/Unlink the node*/
        }
        /*Zero or one child*/
        else {
            data = currentNode!.data
            tempNode = currentNode!
            if (currentNode!.left == nil) {
                child = currentNode!.right?
            }
            if currentNode!.right == nil {
                child = currentNode!.left?
            }
            tempNode.left = nil; tempNode.right = nil      /*Free/Unlink the node*/
            
            return child
        }
        
        return currentNode
    }
    
    private func _deleteMin(var node: BSTnode<T>) -> BSTnode<T> {
        var parent: BSTnode<T>?
        
        parent = nil
        while node.left != nil {
            parent = node
            node = node.left!
        }
        if parent == nil {
            return node    /*Only one node, therefore it is the min*/
        }
        else {
            parent!.left = node.right    /*disconnect the minimum node*/
            return node
        }
    }
    private func deleteInternal(var key: T, var _ startNode: BSTnode<T>) -> T? {
        
        var target: BSTnode<T>?   /*Node to be deleted*/
        var parent: BSTnode<T>    /*Parent of the node to be deleted, i.e, parent of |target| */
        var side: Int             /*Side of the parent where |target| is located: 0 - left, 1-right*/
        var data: T?              /*Return value*/
        
        //Dummies assignment to prevent compiler warnings
        
        parent = startNode
        target = root!
        side = 0
        
        //Locate the node to be deleted
        while (target!.data != key) {
            parent = target!
            if (key < target!.data) {
                target = target!.left
                side = 0
            }
            else {
                target = target!.right
                side = 1
            }
            
            if (target == nil) {
                return nil
            }
        }
        //At this point, the node to be deleted has been found already
        data = target!.data
        
        //Case 1: NODE TO BE DELETED HAS NO RIGHT CHILD
        if (target!.right == nil) {
            //Replace the node to be deleted with its left child
            if (side == 0) {
                parent.left = target!.left
            }
            else {
                parent.right = target!.left
            }
            
        }
        else {
            //Case 2: TARGET'S RIGHT CHILD HAS NO LEFT CHILD
            var r: BSTnode<T> = target!.right!
            if r.left == nil {
                //Give the target node's left child as the new left child of target's right child
                r.left = target!.left
                //Replace the target node with its right child
                if (side == 0) {
                    parent.left = r
                }
                else {
                    parent.right = r
                }
            }
            //Case 3: TARGET'S RIGHT CHILD HAS A LEFT CHILD
            //        Delete the target's inorder successor
            //        and place in the spot to be vacated by the target
            else {
                var smallest: BSTnode<T>
                
                smallest = r.left!
                while (smallest.left != nil) {
                    r = smallest
                    smallest = smallest.left!
                }
                r.left = smallest.right
                smallest.left = target!.left
                smallest.right = target!.right
                if (side == 0) {
                    parent.left = smallest
                }
                else {
                    parent.right = smallest
                }
            }
        }
        target!.left = nil;  target!.right = nil
        
        return data
        
    }
    public func delete(var key: T) -> T? {
        
        var data: T?
        
        //Special case if the tree is empty
        if isEmpty() {
            data = nil
        }
        //Special case if the node to delete is the root
        else if root!.data == key {
            var auxRoot: BSTnode<T> = BSTnode (key)
            auxRoot.left = root;   auxRoot.right = nil
            data = deleteInternal(key, auxRoot)
            root = auxRoot.left
            
            auxRoot.left = nil;   auxRoot.right = nil  //Clean-up for ARC?
        }
        //General case
        else {
            data = deleteInternal(key, root!)
        }
        
        return data
    }

}