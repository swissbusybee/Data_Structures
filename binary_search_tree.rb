class Node
  include Comparable

    attr_accessor :data, :left, :right

    def initialize(data=nil)
      @data = data
      @left = nil
      @right = nil
    end

    def <=>(other)
      data <=> other.data
    end

  end

  class Tree
  attr_accessor :root

    def initialize
      @root = nil
    end

    def build_tree(data)
      self.root = nil
      data.uniq.each do |num|
        insert(num, root)
      end
      root
    end

    def delete(value)
      values = level_order
      values.delete(value)
      build_tree(values)
    end

    def find(value)
      level_order { |node| return node if node.data == value }
    end

    def level_order
      queue = []
      values = []
      queue << root
      while !queue.empty?
        node = queue.shift
        block_given? ? yield(node) : values << node.data
        queue << node.left if node.left
        queue << node.right if node.right
      end
      values if !block_given?
    end

    ["pre", "in", "post"].each do |name|
      define_method("#{name}order") do |node, values, &block|
        return if node.nil?
        if name == "pre"
          block.call(node) if block
          values << node.data
          preorder(node.left, values) { |node| block.call(node) if block }
          preorder(node.right, values) { |node| block.call(node) if block }
        elsif name == "in"
          inorder(node.left, values) { |node| block.call(node) if block }
          block.call(node) if block
          values << node.data
          inorder(node.right, values) { |node| block.call(node) if block }
        elsif name == "post"
          postorder(node.left, values) { |node| block.call(node) if block }
          postorder(node.right, values) { |node| block.call(node) if block }
          block.call(node) if block
          values << node.data
        end
        values if !block
      end
    end

    # Returns the number of levels beneath given node
    def depth(node, count=0, arr=[])
      return arr.max if node.nil?
      arr << count
      depth(node.left, count + 1, arr)
      depth(node.right, count + 1, arr)
    end

    def balanced?
      left = depth(root.left, 0, [])
      right = depth(root.right, 0, [])
      return true if left.nil? || right.nil?
      (left - right).abs <= 1
    end

    def rebalance
      new_tree = inorder(root, [])
      new_tree = new_tree.rotate(new_tree.size / 2)
      build_tree(new_tree)
    end

    private

    def insert(value, node)
      if root.nil?
        self.root = Node.new(value)
      elsif value > node.data
        if node.right.nil?
          node.right = Node.new(value)
        else
          insert(value, node.right)
        end
      elsif value < node.data
        if node.left.nil?
          node.left = Node.new(value)
        else
          insert(value, node.left)
        end
      end
      root
    end

  end

tree = Tree.new
tree.build_tree(Array.new(15) { rand(1..100)})

#Test Script
puts "Is tree balanced? : #{tree.balanced?}"
puts "Tree elements in level order:"
tree.level_order { |node| puts node.data }
puts "Tree elements in preorder:"
tree.preorder(tree.root, []) { |node| puts node.data }
puts "Tree elements inorder:"
tree.inorder(tree.root, []) { |node| puts node.data }
puts "Tree elements in postorder:"
tree.postorder(tree.root, []) { |node| puts node.data }
tree.rebalance
puts "Tree is now balanced?: #{tree.balanced?}"
