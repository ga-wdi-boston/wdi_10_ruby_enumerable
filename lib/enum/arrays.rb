class Array

  def initialize(array)
    @array = array
  end

  def sum_of_numeric_elements
    @array.select {|num| num.class == Fixnum || num.class == Float}.inject(:+)
  end

  def product_of_numeric_elements
    @array.select {|num| num.class == Fixnum || num.class == Float}.inject(:*)
  end

  def even_numeric_elements
    @array.select {|num| num.class == Fixnum && num.even?}
  end

  def odd_numeric_elements
    @array.select {|num| num.class == Fixnum && num.odd?}
  end

  def string_elements
    @array.select {|word| word.class == String}
  end

  def lowercase_string_elements_as_uppercase
  select { |word| word.is_a?(String) && word.chars.first == word.chars.first.downcase }.map(&:capitalize)
  end

  def capitalized_elements
    string_elements.reject do |word|
       word == word.downcase
    end
  end

end
