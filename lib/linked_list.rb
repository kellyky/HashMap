# frozen_string_literal: true

require_relative 'node'
require 'pry-byebug'

# LinkedList class with methods to append, prepend, etc. new nodes to the list
class LinkedList
  attr_reader :size, :head, :tail

  def initialize
    @size = 0
    @tail = nil
    @head = nil
  end

  def append(key, value)
    @size += 1

    if @tail.nil?
      @tail = Node.new(key, value)
    else
      @tail.next_node = Node.new(key, value)
      @tail = @tail.next_node
    end

    @head = @tail if @head.nil?
  end
end
