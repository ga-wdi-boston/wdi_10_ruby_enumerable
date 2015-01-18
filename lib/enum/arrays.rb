class Array

  def initialize(array)
    @array = array
  end

  def sum_of_numeric_elements
    @array.select { |item| item.is_a? Numeric }.reduce(:+)
  end

  def product_of_numeric_elements
    @array.select { |item| item.is_a? Numeric }.reduce(:*)
  end

  def even_numeric_elements
    @array.select { |item| item.is_a? Fixnum }.select { |item| item.even? }
  end

  def odd_numeric_elements
    @array.select { |item| item.is_a? Fixnum }.select { |item| item.odd? }
  end

  def string_elements
    @array.select { |item| item.is_a? String }
  end

  def lowercase_string_elements_as_uppercase
    @array.select do |item|
      item.is_a? String
    end.select do | string|
      string == string.downcase
    end.map { |string| string.capitalize }
  end

  def capitalized_elements
    @array.select { |item| item.is_a? String }.select { |string| string[0] == string[0].upcase }
  end

  private

  def array
    @array
  end

end
