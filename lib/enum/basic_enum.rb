# Basic enumeration on collection objects (hash, array)

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
  #Length of structure
  def number_of_elements_in_collection
    collection.count
  end
  #Counts the numbers
  def number_of_floats_or_fixnums
    collection.map{|elem| elem.is_a?(Numeric)}.count(true)
  end
  #Returns boolean if all words are longer than len
  def all_words_longer_than_length?(min_length)
    collection.all?{ |word| word.length > min_length}
  end
   #Returns boolean if a word are longer than min_length
  def contains_a_word_longer_than?(min_length)
    collection.any?{ |word| word.length > min_length}
  end
  #Capitalize words in an array
  def capitalize_words
    collection.map(&:capitalize)
  end
  #Squares each number in an array
  def square_numbers
    collection.map{ |num| num**2 }
  end
  #Reverses each word in an array
  def reverse_words
    collection.map(&:reverse)
  end
  #Returns an array with the +/- numbers in inputed array
  def positive_and_negative_numbers
    collection.flat_map{ |num| [num.abs, -num.abs] }
  end
  #Finds first :awesome value and retruns name from structure
  def find_first_awesome_person
    collection.find{|stat| stat[:awesome] == true}
  end
  #Removes 1st three from an array.
  def remove_first_three
    collection.drop(3)
  end
  #Returns an array with dropped words until 'hot' from an inputed array.
  def drop_until_its_hot
    collection.drop_while { |word| word != "hot" }
  end
  #Returns a 2-d array from a split input array.
  def groups_of(num)
    collection.each_slice(num).to_a
  end
  #Returns a hash of the frequency count of the words in an array
  def element_frequency_count
    collection.each_with_object({}) do |key, freq_hash|
      freq_hash[key] = collection.count(key)
    end
  end
  #Returns an index of the first awesome person
  def index_of_first_awesome_element
    collection.find_index{|info| info[:awesome]}
  end
  #Returns an array of strings ending in "er" in an array
  def elements_ending_in_er
    collection.find_all{|word| word.split("").last(2) == ["e","r"]}
  end
  #Returns a hash of fav languages as keys & hashes of who like them
  def group_elements_by_favorite_language
    collection.group_by{|person| person[:favorite_language]}
  end
  #Returns an Fixnum sum of experiences
  def sum_of_experiences
    collection.map{ | person | person[:years_experience] }.reduce(:+)
  end
  #Returns the person element with longest name
  def longest_element_name_using_inject
    collection.inject{ |longest, info| longest[:name].length > info[:name].length ? longest : info}
  end
  #Returns the person element with the most years experience
  def most_experienced_element
    collection.max_by { |info| info[:years_experience] }
  end
  #Returns true if the element is present in the collection
  def element_present?(name)
    collection.include?(name)
  end
  #Returns an array of elements with longest and shortest names
  def elements_with_longest_and_shortest_names
    collection.minmax_by { |info| info[:name].length }
  end
  #Returns an array splitting up elements who do/don\'t' funct prog.
  def separate_elements_that_like_functional_programming_from_rest
   collection.partition{|info| info[:likes_functional_programming]}
  end
  #Returns an array of elements who do not like functional programming
  def elements_who_dislike_functional_programming
    collection.reject{ |info| info[:likes_functional_programming] }
  end
  #Returns an array sorted by yrs of experience
  def elements_sorted_by_experience
    collection.sort{ |person1, person2| person1[:years_experience] <=> person2[:years_experience] }
  end
  #Returns an array of elements with longest and shortest names
  def first_x_elements(num)
    collection.take(num)
  end

  private

  def collection
    @collection
  end

end
