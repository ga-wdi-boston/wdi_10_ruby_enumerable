# Basic enumeration on collection objects (hash, array)
require 'pry'
# This is NOT the Enumerable module.
# The name is close, but this is just us writing implementation of all of the enumerable methods in actions
class MyEnumeration
  # Do not modify the initialize
  # This statement allows the rspec tests to create a new collection that will then be tested
  # MyEnumeration.new(['foo', 'bar'])
  def initialize(collection)
    @collection = collection
  end

  # EXAMPLE: THIS ONE IS DONE FOR YOU
  # Refer to count
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-count
  def number_of_elements_in_collection
    # collection here refers to the collection that is set with the initialize method
    # collection() is a private accessor method at the bottom of this class that accesses @collection
    collection.count
  end

  # This one also uses 'count'
  # Try it yourself!
  def number_of_floats_or_fixnums
    collection.select { |ele| ele.is_a? (Numeric)}.count
  end


  # Refer to: all?
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-all-3F
  def all_words_longer_than_length?(min_length)
    collection.all? { |ele| ele.length > min_length }
  end

  # For the next 3 methods refeall?r to: collect or map
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-any-3F
  def contains_a_word_longer_than?(min_length)
    collection.any? { |ele| ele.length > min_length }
  end

  def capitalize_words
    collection.map { |ele| ele.capitalize }
  end

  def square_numbers
    collection.map { |ele| ele * ele}
  end

  # Use symbol to proc notation on this one!
  def reverse_words
    collection.map { |ele| ele.reverse }
  end

  # Refer to collect_concat or flat_map for these next two
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-flat_map
  # To get the order right for the tests, you'll need to use the absolute value method
  def positive_and_negative_numbers
    collection.flat_map { |ele| [ele.abs, -ele.abs] }
  end

  # Refer to detect or find
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-detect
  def find_first_awesome_person
    collection.find {|hash| hash[:awesome] == true}
  end

  # Refer to drop
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-drop
  def remove_first_three
    collection.drop(3)
  end

  # Refer to drop_while
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-drop_while
  def drop_until_its_hot
    collection.drop_while {|ele| ele != 'hot'}
  end


  # Refer to each_slice
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-each_slice
  # Tip: After .each_slice chain on .to_a to turn the returned Enumerator into an array
  def groups_of(num)
    collection.each_slice(num).to_a
  end


  # Refer to each_with_object
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-each_with_object
  # Tip: You'll have to do .each_with_object(Hash.new(0)) to create a hash to start with. Do not save the hash in a variable. You may use the incrementor method here.
  def element_frequency_count
    collection.each_with_object(Hash.new(0)) { |num, word| word[num] += 1}
  end


  # Refer to find_all / select
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-find-all
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-select
  def elements_ending_in_er
    collection.find_all { |werd| werd.end_with? 'er'}
  end


  # Refer to find_index
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-find-index
  def index_of_first_awesome_element
    collection.find_index { |person| person[:awesome] == true}
  end

  # Refer to group_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-group-by
  def group_elements_by_favorite_language
    collection.group_by { |person| person[:favorite_language]}
  end

  # Refer to inject / reduce
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-inject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reduce
  def sum_of_experiences
    collection.map { |person| person[:years_experience]}.inject(:+)
  end

  # Refer to inject / reduce
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-inject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reduce
  def longest_element_name_using_inject
    collection.max_by { |person| person[:name].length }
  end

  # Refer to max_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-max-by
  def most_experienced_element
    collection.max_by { |person| person[:years_experience] }
  end

  # Refer to include? / member?
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-include-3F
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-member-3F
  def element_present?(name)
    collection.include?(name)
  end

  # Refer to minmax_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-minmax_by
  def elements_with_longest_and_shortest_names
    collection.minmax_by { |person| person[:name].length }
  end

  # Refer to partition
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-partition
  def separate_elements_that_like_functional_programming_from_rest
    collection.partition {|person| person[:likes_functional_programming] == true }
  end

  # Refer to reject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reject
  def elements_who_dislike_functional_programming
    collection.reject {|person| person[:likes_functional_programming] == true }
  end

  # Refer to sort
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-sort
  # You will need to use the 'spaceship' operator <=>
  def elements_sorted_by_experience
    collection.sort { |per1, per2| per1[:years_experience] <=> per2[:years_experience] }
  end

  # Refer to take
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-take
  def first_x_elements(x)
    collection.take(x)
  end

  private

  def collection
    @collection
  end

end
