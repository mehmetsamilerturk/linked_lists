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
    result = nil
    current = @head
    count = 0

    until current.nil?
      result = count if current.value == value
      current = current.next_node
      count += 1
    end

    result
  end

  def to_s
    current = @head
    result = ""
    until current.nil?
      result << "( #{current.value} ) -> "
      current = current.next_node
      result << "nil" if current.nil?
    end

    result
  end

  def insert_at(value, index)
    current = @head
    count = 0

    until current.nil?
      if count == index
        at(index - 1).next_node = Node.new(value, at(index))
      end
      current = current.next_node
      count += 1
    end

    @head
  end

  def remove_at(index)
    current = @head
    count = 0

    until current.nil?
      if count == index
        deleted = at(index)
        at(index - 1).next_node = at(index + 1)
      end
      current = current.next_node
      count += 1
    end

    deleted
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
list.append(40)
list.append(50)
list.append(60)
list.append(70)
list.append(80)
list.prepend(30)
list.prepend(20)
list.prepend(10)
list.append(90)
list.prepend(5)

puts list
puts '#size'
p list.size
puts '#head'
p list.head
puts '#tail'
p list.tail
puts '#at'
p list.at(2)
puts '#pop'
p list.pop
puts ''
puts list
puts '#contains'
#p list.reverse
p list.contains(1)
p list.contains(9)
puts '#find'
p list.find(40)
puts ''
puts list
puts '#insert_at'

puts list
p list.insert_at(12, 2)
puts '#remove_at'
puts list
p list.remove_at(3)
puts list