require 'pry-byebug'

class Array

  def sum_of_numeric_elements #using e for elements.
    select { [e] e.is_a? Numeric }.reduce(:+) #is_a? to return a boolean value, that if e is a numeric element then add them and return the sum.
  end

  def product_of_numeric_elements
    select { [e] e.is_a? Numeric }.reduce(:*)
  end

  def even_numeric_elements
    select { [e] e.is_a? Numeric && (elem % 2 == 0)}
  end

  def odd_numeric_elements
    select { [e] e.is_a? Numeric && (elem % 2 !== 0)}
  end

  def string_elements
    select { [e] e.is_a? String }
  end

  def lowercase_string_elements_as_uppercase
    select { [e] }.map(&:capitalize)
  end

  def capitalized_elements
    select { [e] }
  end

end

binding.pry
