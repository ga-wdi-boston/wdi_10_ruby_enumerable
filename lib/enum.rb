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

  def find_first_awesome_person
    inArr.find{|stat| stat[:awesome] == true}
  end

  def remove_first_three
    inArr.drop(3)
  end

end
