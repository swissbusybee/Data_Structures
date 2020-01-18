class LinkedList
  attr_accessor :list, :head, :tail

  def initialize
    @list
    @head
    @tail
  end

  def append(node)
    if self.list.nil?
      self.list = node
      self.head = node.dup
      self.tail = node.dup
    else
      current_node = self.list
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = node
      self.tail = node.dup
    end
    set_index
  end

  def prepend(node)
    self.head = node.dup
    current_list = self.list
    self.list = node
    self.list.next_node = current_list
    set_index
  end

  def size
    return "No nodes" if self.list.nil?
    count = 1
    current_node = self.list
    while current_node.next_node
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def pop
    return self.list = nil if self.size <= 1
    current_node = self.list
    (self.size-2).times {
      current_node = current_node.next_node
    }
    current_node.next_node = nil
  end

  def contains?(value)
    current_node = self.list
    while current_node
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def find(data)
    current_node = self.list
    while current_node
      return current_node.index if current_node.value == data
      current_node = current_node.next_node
    end
  end

  def insert_at(index, node)
    return prepend(node) if index < 1
    return append(node) if index > self.size
    current_node = self.list
    until current_node.index == index - 1
      current_node = current_node.next_node
    end
    end_of_list = current_node.next_node
    current_node.next_node = node
    current_node.next_node.next_node = end_of_list
    set_index
  end

  def remove_at(index)
    return self.pop if index >= self.size
    return remove_head if index < 1
    current_node = self.list
    until current_node.index == index - 1
      current_node = current_node.next_node
    end
    end_of_list = current_node.next_node.next_node
    current_node.next_node = end_of_list
    set_index
  end

  def to_s
    current_node = self.list
    list_arr = []
    while current_node
      list_arr << current_node.value
      current_node = current_node.next_node
    end
    list_string = ""
    list_arr.each { |data| list_string << "(#{data}) -> " }
    list_string << "nil"
  end

  private

  def set_index
    current_node = self.list
    num = 0
    while current_node
      current_node.index = num
      num += 1
      current_node = current_node.next_node
    end
  end

  def remove_head
    end_of_list = self.list.next_node
    self.list = end_of_list
    set_index
  end

end

class Node
  attr_accessor :value, :next_node, :index

  def initialize(value=nil)
    @index = nil
    @value = value
    @next_node = nil
  end
end

linkedlist = LinkedList.new
puts "Appending Node 10... #{linkedlist.append(Node.new(10))}"
puts "Appending Node 3... #{linkedlist.append(Node.new(3))}"
puts "Prepending Node 5... #{linkedlist.prepend(Node.new(5))}"
puts "Current linked list: #{linkedlist.to_s}"
puts "Linked list Size: #{linkedlist.size}"
puts "Calling pop method...#{linkedlist.pop}"
puts "Current linked list: #{linkedlist.to_s}"
puts "List contains node of value 10? #{linkedlist.contains?(10)}"
puts "List contains node of value 11? #{linkedlist.contains?(11)}"
puts "Finding index of value 10: #{linkedlist.find(10)}"
puts "Inserting Node of value 22 at index 1... #{linkedlist.insert_at(1, Node.new(22))}"
puts "Current linked list: #{linkedlist.to_s}"
puts "Inserting Node of value 35 at index 0... #{linkedlist.insert_at(0, Node.new(35))}"
puts "Current linked list: #{linkedlist.to_s}"
puts "Removing Node at index 1: #{linkedlist.remove_at(1)}"
puts "Current linked list: #{linkedlist.to_s}"
p linkedlist.list
