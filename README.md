# The Odin Project
## Ruby - Data Structures - Linked Lists
### A Ruby implementation of Linked Lists.

Node.new(value) instantiates a new node with given value.

LinkedList.new instantiates a new linked list.

### Available LinkedList methods:

#append(node): Adds Node to linked list.
#prepend(node): Adds node to beginning of linked list.
#size: Returns current size of linked list.
#head: Returns first node in list.
#tail: Returns last node in list.
#pop: Removes last node from list.
#contains?(value): Returns true or false depending on whether value is present within linked list.
#find(value): Returns index of Node in list from value. Nil if node is not present within the list.
#to_s: returns string representation of linked list.
#insert_at(index, node): Inserts Node at given index within list. At the front of the list if index is < 1 or at the end if index is > list size.
#remove_at(index): Removes node at given index within list. Removes the first node if index is < 1 or removes last node if given index is > list size.

## Ruby - Data Structures - Binary Search Tree
### A Ruby implementation of a binary search tree.

Node.new(data) instantiates a new node with @data, @right and @left instance variables.

Node instances can be compared directly without having to access their data value.
Tree.new instantiates a new Tree instance. Sets @root variable to nil.

### Available Tree methods:

#build_tree(data): Builds a binary tree from an array.
#delete(value): Deletes the given value from the tree.
#find(value): Returns the node from the tree that matches the given value.
#level_order: Returns an array of node data from the tree in level order.
#level_order { |item| block }: If a block is given each node is passed to the block in level order as they're found.
#preorder(node, values): Returns an array of node data from the tree in preorder.
#preorder(node, values) { |item| block }: If a block is given each node is passed to the block in preorder as they're found.
#inorder(node, values): Returns an array of node data from the tree inorder.
#inorder(node, values) { |item| block }: If a block is given each node is passed to the block inorder as they're found.
#postorder(node, values): Returns an array of node data from the tree in postorder.
#postorder(node, values) { |item| block }: If a block is given each node is passed to the block in postorder as they're found.
#depth(node): Returns the number of levels beneath the given node.
#balanced?: Returns whether the tree is balanced or not.
#rebalance: Rebalances the binary tree.

## Ruby - Data Structures - Knight's Travails
### This project looked at combining my knowledge of binary search trees and search algorithms to produce a method that returns the quickest possible route of a knight chess piece from one point on a chess board to the other.

Knight.new instatiates a new Knight object.

### Available Knight methods:

#knight_moves(start, finish): Accepts a starting position on the chess board and a target end point. Board positioning comes in the form of x & y (0 - 7) coordinates in an array eg ([1,2], [4,7]). The method will return the shortest path to the target.
