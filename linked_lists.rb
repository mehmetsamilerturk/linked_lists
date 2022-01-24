# frozen_string_literal: true

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      node = @head
      node = node.next_node until node.next_node.nil?
      node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      node = @head
      @head = Node.new(value)
      @head.next_node = node
    end
  end

  def size
    count = 0
    current = @head

    until current.nil?
      current = current.next_node
      count += 1
    end

    count
  end

  def tail
    current = @head
    current = current.next_node until current.next_node.nil?

    current
  end

  def at(index)
    count = 0
    current = @head

    until count == index
      current = current.next_node
      count += 1
    end

    current
  end

  def pop
    current = @head
    current = current.next_node until current.next_node == tail

    deleted = current.next_node
    current.next_node = nil
    deleted
  end

  def reverse
    prev = nil
    current = @head
    nex = nil

    until current.next_node.nil?
      nex = current.next_node
      current.next_node = prev
      prev = current
      current = nex
    end

    node = prev
    prev = Node.new(nex)
    prev.next_node = node

    prev
  end

  def contains(value)
    current = @head
    result = false
    until current.nil?
      result = true if current.value == value
      current = current.next_node
    end

    result
  end

  def find(value)
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append(4)
list.append(5)
list.append(6)
list.append(7)
list.append(8)
list.prepend(3)
list.prepend(2)
list.prepend(1)

# p list
# puts ''
# p list.size
# puts ''
# p list.head
# puts ''
# p list.tail
# puts ''
# p list.at(2)
# puts ''
# p list.pop
# puts ''
# p list
# puts ''
# p list.reverse
# puts ''
# p list.contains(1)
# p list.contains(9)
# puts ''
