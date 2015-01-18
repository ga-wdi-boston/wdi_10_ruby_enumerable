require 'enum/basic_enum'
require 'enum/arrays'
require 'enum/nested'

class MyEnumeration

  attr_reader :inStruct

  def initialize(inStruct)
    @inStruct = inStruct
  end
  #Counts the numbers
  def number_of_floats_or_fixnums
    inStruct.map{|elem| elem.is_a?(Numeric)}.count(true)
  end
  #Length of structure
  def number_of_elements_in_collection
    inStruct.count
  end
  #Returns boolean if all words are longer than len
  def all_words_longer_than_length?(len)
    inStruct.all?{ |word| word.length > len}
  end
  #Returns boolean if a word are longer than len
  def contains_a_word_longer_than?(len)
    inStruct.any?{ |word| word.length > len}
  end
  #Capitalize words in an array
  def capitalize_words
    inStruct.map(&:capitalize)
  end
  #Squares each number in an array
  def square_numbers
    inStruct.map{ |num| num**2 }
  end
  #Reverses each word in an array
  def reverse_words
    inStruct.map(&:reverse)
  end
  #Returns an array with the +/- numbers in inputed array
  def positive_and_negative_numbers
    inStruct.flat_map{ |num| [num.abs, -num.abs] }
  end
  #Finds first :awesome value and retruns name from structure
  def find_first_awesome_person
    inStruct.find{|stat| stat[:awesome] == true}
  end
  #Removes 1st three from an array.
  def remove_first_three
    inStruct.drop(3)
  end
  #Returns an array with dropped words until 'hot' from an inputed array.
  def drop_until_its_hot
    inStruct.drop_while { |word| word != "hot" }
  end
  #Returns a 2-d array from a split input array.
  def groups_of(num)
    inStruct.each_slice(num).to_a
  end
  #Returns a hash of the frequency count of the words in an array
  def element_frequency_count
    inStruct.each_with_object({}) do |key, freq_hash|
      freq_hash[key] = inStruct.count(key)
    end
  end
  #Returns an array of strings ending in "er" in an array
  def elements_ending_in_er
    inStruct.find_all{|word| word.split("").last(2) == ["e","r"]}
  end
  #Returns an index of the first awesome person
  def index_of_first_awesome_element
    inStruct.find_index{|info| info[:awesome]}
  end
  #Returns a hash of fav languages as keys & hashes of who like them
  def group_elements_by_favorite_language
    inStruct.group_by{|person| person[:favorite_language]}
  end
  #Returns an Fixnum sum of experiences
  def sum_of_experiences
    inStruct.map{ | person | person[:years_experience] }.reduce(:+)
  end
  #Returns the person element with longest name
  def longest_element_name_using_inject
    inStruct.inject{ |longest, info| longest[:name].length > info[:name].length ? longest : info}
  end
  #Returns the person element with the most years experience
  def most_experienced_element
    inStruct.max_by { |info| info[:years_experience] }
  end
  #Returns true if the element is present in the collection
  def element_present?(name)
    inStruct.include?(name)
  end
  #Returns an array of elements with longest and shortest names
  def elements_with_longest_and_shortest_names
    inStruct.minmax_by { |info| info[:name].length }
  end
  #Returns an array splitting up elements who do/don\'t' funct prog.
  def separate_elements_that_like_functional_programming_from_rest
   inStruct.partition{|info| info[:likes_functional_programming]}

  end
  #Returns an array of elements who do not like functional programming
  def elements_who_dislike_functional_programming
    inStruct.reject{ |info| info[:likes_functional_programming] }
  end
  #Returns an array sorted by yrs of experience
  def elements_sorted_by_experience
    inStruct.sort{ |person1, person2| person1[:years_experience] <=> person2[:years_experience] }
  end
  #Returns an array of elements with longest and shortest names
  def first_x_elements(num)
    inStruct.take(num)
  end

end


class Array

  attr_reader :inArr

  def initialize(inArr)
    @inArr = inArr
  end
  #Sums all Float and Fixnum elements
  def sum_of_numeric_elements
    inArr.select{ |num| num.is_a?(Numeric) }.reduce(:+)
  end
  #Multiplies all Float and Fixnum elements
  def product_of_numeric_elements
    inArr.select{ |num| num.is_a?(Numeric) }.reduce(1, :*)
  end
  #Returns only even Fixnum elements
  def even_numeric_elements
    inArr.select{ |num| num.is_a?(Fixnum) && num.even? }
  end
  #Returns only odd Fixnum elements
  def odd_numeric_elements
    inArr.select{ |num| num.is_a?(Fixnum) && num.odd? }
  end
  #Returns only String elements
  def string_elements
    inArr.select{ |elem| elem.is_a?(String)}
  end
  #Returns String elements that are lowercase in uppercase
  def lowercase_string_elements_as_uppercase
    inArr.select{ |elem| elem.is_a?(String) && elem.match(/\b[a-z]/)}.map(&:capitalize)
  end
  #Returns String elements that are uppercase
  def capitalized_elements
    inArr.select{ |elem| elem.is_a?(String) && elem.match(/\b[A-Z]/)}
  end

end

class People

  attr_reader :info
  def initialize(info)
    @info = info
  end

  #Returns a sum of ages from a struct of classes
  def ages_sum
    info.each_with_object([]){ |ind, ages| ages << ind.instance_variable_get(:@age) }.reduce(:+)
  end
  #Returns an average of ages from a struct of classes
  def average_age
    info.each_with_object([]){ |ind, ages| ages << ind.instance_variable_get(:@age) }.reduce(:+)/info.length
  end
  #Returns the total yr programming  from a struct of classes
  def total_years_programming_experience_for_all_languages
    info.each_with_object([]){ |ind, year| year << ind.instance_variable_get(:@years_language_experience).values }.flatten!.reduce(:+)
  end
  #Returns a hash of food frequencies from a struct of classes
  def favorite_food_frequency
    MyEnumeration.new(info.each_with_object([]){ |ind, food| food << ind.instance_variable_get(:@favorite_foods) }.flatten!).element_frequency_count
  end
  #Returns the combined yrs from all languages in a struct of classes
  def total_combined_years_language_experience(lang)

    info.each_with_object([]){ |ind, years| years << ind.instance_variable_get(:@years_language_experience)[lang.to_sym] }.compact.reduce(:+)
    end

end
