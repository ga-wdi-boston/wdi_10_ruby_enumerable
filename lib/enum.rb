require 'enum/basic_enum'
require 'enum/arrays'
require 'enum/nested'

class MyEnumeration

  attr_reader :inArr

  def initialize(inArr)
    @inArr = inArr
  end

  def number_of_floats_or_fixnums
    inArr.map{|elem| elem.is_a?(Numeric)}.count(true)
  end

  def number_of_elements_in_collection
    inArr.count
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

  def most_experienced_element
    inArr.max_by { |info| info[:years_experience] }
  end

  def element_present?(name)
    inArr.include?(name)
  end

  def elements_with_longest_and_shortest_names
    inArr.minmax_by { |info| info[:name].length }
  end

  def separate_elements_that_like_functional_programming_from_rest
   inArr.partition{|info| info[:likes_functional_programming]}

  end

  def elements_who_dislike_functional_programming
    inArr.reject{ |info| info[:likes_functional_programming] }
  end

  def elements_sorted_by_experience
    inArr.sort{ |person1, person2| person1[:years_experience] <=> person2[:years_experience] }
  end

  def first_x_elements(num)
    inArr.take(num)
  end

end


class Array

  def sum_of_numeric_elements
    select{ |num| num.is_a?(Numeric) }.reduce(:+)
  end

  def product_of_numeric_elements
    select{ |num| num.is_a?(Numeric) }.reduce(1, :*)
  end

  def even_numeric_elements
    select{ |num| num.is_a?(Fixnum) && num.even? }
  end

  def odd_numeric_elements
    select{ |num| num.is_a?(Fixnum) && num.odd? }
  end

  def string_elements
    select{ |elem| elem.is_a?(String)}
  end

  def lowercase_string_elements_as_uppercase
    select{ |elem| elem.is_a?(String) && elem.match(/\b[a-z]/)}.map(&:capitalize)
  end

  def capitalized_elements
    select{ |elem| elem.is_a?(String) && elem.match(/\b[A-Z]/)}
  end

end

class People

  attr_reader :info
  def initialize(info)
    @info = info
  end


  def ages_sum
    info.each_with_object([]){ |ind, ages| ages << ind.instance_variable_get(:@age) }.reduce(:+)
  end

  def average_age
    info.each_with_object([]){ |ind, ages| ages << ind.instance_variable_get(:@age) }.reduce(:+)/info.length
  end

  def total_years_programming_experience_for_all_languages
    info.each_with_object([]){ |ind, year| year << ind.instance_variable_get(:@years_language_experience).values }.flatten!.reduce(:+)
  end

  def favorite_food_frequency
    MyEnumeration.new(info.each_with_object([]){ |ind, food| food << ind.instance_variable_get(:@favorite_foods) }.flatten!).element_frequency_count
  end

  def total_combined_years_language_experience(lang)

    info.each_with_object([]){ |ind, years| years << ind.instance_variable_get(:@years_language_experience)[lang.to_sym] }.compact.reduce(:+)
    end

end
