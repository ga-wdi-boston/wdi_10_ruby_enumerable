require 'pry'

class Array

  def sum_of_numeric_elements
    self.select { |element| element.is_a? Integer}.reduce(:+) + self.select { |element| element.is_a? Float}.reduce(:+)
  end

  def product_of_numeric_elements
    self.find_all { |element| element.is_a? Integer }.inject(:*) * self.find_all { |floats| floats.is_a? Float }.inject(:*)
  end

  def even_numeric_elements
    self.select { |element| element.is_a? Integer }.select { |element| element.even? }
  end

  def odd_numeric_elements
    self.select { |element| element.is_a? Integer }.select { |element| element.odd? }
  end

  def string_elements
    self.find_all { |element| element.is_a? String }
  end

  def lowercase_string_elements_as_uppercase
    self.find_all { |element| element.is_a? String }.select { |element| element == element.downcase }.map { |element| element.capitalize }
  end

  def capitalized_elements
    binding.pry
    self.find_all { |element| element.is_a? String }.reject { |element| element == element.downcase }
  end

end
