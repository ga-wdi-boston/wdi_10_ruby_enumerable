class Array

  def initialize(array)
    @array = array
  end

  def sum_of_numeric_elements
    @array.select { |item|
    item.class == Fixnum || item.class == Float
     }.reduce(:+)
  end

  def product_of_numeric_elements
    @array.select { |item|
    item.class == Fixnum || item.class == Float
     }.reduce(:*)
  end

  def even_numeric_elements
    @array.select { |item| item.class == Fixnum && item % 2 == 0}
  end

  def odd_numeric_elements
    @array.select { |item| item.class == Fixnum && item % 2 != 0}
  end

  def string_elements
    @array.select { |item| item.class == String}
  end

  def lowercase_string_elements_as_uppercase
    string_elements.map { |item|
    if item == item.downcase
      item.capitalize
    end}.compact
  end

  def capitalized_elements
    string_elements.reject { |item|
    item == item.downcase}
  end
end
