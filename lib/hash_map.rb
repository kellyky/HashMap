# frozen_string_literal: true

require_relative 'linked_list'
require 'pry-byebug'

# Create and work with data structure, HashMap
class HashMap
  def initialize
    @buckets = Array.new(16) 
    @capacity = @buckets.length
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % @capacity
  end

  def set(key, value)
    grow_bucket_list
    hash_key = hash(key)

    if @buckets[hash_key].nil?
      bucket = LinkedList.new
      @buckets[hash_key] = bucket.append(key, value)
    else
      @buckets.at(hash_key).value = value
    end
  end

  def grow_bucket_list
    return if length < @capacity * @load_factor

    @buckets.concat(Array.new(@capacity))
    @capacity = @buckets.length
  end

  def get(key)
    hash_key = hash(key)
    @buckets[hash_key]&.value
  end

  def has?(key)
    hash_key = hash(key)

    @buckets[hash_key].nil? ? false : true
  end

  def remove(key)
    return unless has?(key)

    hash_key = hash(key)
    bucket = @buckets[hash_key]

    @buckets[hash_key] = nil
    bucket.value
  end

  def length
    @buckets.map{ |bucket| bucket&.key }.compact.count
  end

  def clear
    @buckets = Array.new(@capacity)
  end

  def keys
    @buckets.map{ |bucket| bucket&.key }.compact
  end

  def values
    @buckets.map{ |bucket| bucket&.value }.compact
  end

  def entries
    buckets_with_data = @buckets.select { |bucket| !bucket&.key.nil? }
    buckets_with_data.map { |b| [b.key, b.value] }
  end
end
