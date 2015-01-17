require 'enum/basic_enum'
require 'enum/arrays'
require 'enum/nested'

class MyEnumeration

  attr_reader :inArr
  def initialize(inArr)
    @inArr = inArr
  end

  def number_of_elements_in_collection
    inArr.count
  end

  def number_of_floats_or_fixnums
    inArr.map{|elem| elem.is_a?(Numeric)}.count(true)
  end

  def sum_of_numeric_elements
    inArr.select { |num| num.is_a? (Numeric) }.reduce(:+)
  end

  def product_of_numeric_elements
    inArr.select { |num| num.is_a? (Numeric) }.reduce(:*)
  end

  def all_words_longer_than_length?(len)
    inArr.all?{ |word| word.length > len}
  end

  def contains_a_word_longer_than?(len)
    inArr.any?{ |word| word.length > len}
  end

  def capitalize_words
    inArr.map(&:capitalize)
  end

  def square_numbers
    inArr.map{ |num| num**2 }
  end

  def reverse_words
    inArr.map(&:reverse)
  end

  def positive_and_negative_numbers
    inArr.flat_map{ |num| [num.abs, -num.abs] }
  end
#11
  def find_first_awesome_person
    inArr.find{|stat| stat[:awesome] == true}
  end

  def remove_first_three
    inArr.drop(3)
  end

  def drop_until_its_hot
    inArr.drop_while { |word| word != "hot" }
  end

  def groups_of(num)
    inArr.each_slice(num).to_a
  end

  def element_frequency_count
    inArr.each_with_object({}) do |key, freq_hash|
      freq_hash[key] = inArr.count(key)
    end
  end
#16
  def elements_ending_in_er
    inArr.find_all{|word| word.split("").last(2) == ["e","r"]}
  end

  def index_of_first_awesome_element
    inArr.find_index{|info| info[:awesome]}
  end

  def group_elements_by_favorite_language
    inArr.group_by{|person| person[:favorite_language]}
  end

  def sum_of_experiences
    inArr.map{ | person | person[:years_experience] }.reduce(:+)
  end

  def longest_element_name_using_inject
    inArr.inject{ |longest, info| longest[:name].length > info[:name].length ? longest : info}
  end
#19 failures
  def most_experienced_element
    inArr.max_by { |info| info[:years_experience] }
  end
  #18 failures
  def element_present?(name)
    inArr.include?(name)
  end
  #17 failures

end
