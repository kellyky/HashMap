# frozen_string_literal: true

require 'pry-byebug'

# Create individual node for LinkedList
class Node
  attr_accessor :key, :value, :next_node

  def initialize(key = nil, value = nil, next_node = nil)
    @key = key
    @next_node = next_node
    @value = value
  end
end
