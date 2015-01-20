require 'pry'
class Array

  def sum_of_numeric_elements
    reduce(0) {|sum, element| (element.class == Fixnum || element.class == Float)? sum += element : sum}
  end

  def product_of_numeric_elements
    reduce(1) {|product, element| (element.class == Fixnum || element.class == Float)? product *= element : product}
  end

  def even_numeric_elements
    select { |element| element.class == Fixnum && element.even? }
  end

  def odd_numeric_elements
    select { |element| element.class == Fixnum && element.odd? }
  end

  def string_elements
    select { |element| element.class == String}
  end

  def lowercase_string_elements_as_uppercase
    #I'm not sure why this one doesn't work the way I want it to
   map { |element| element.class == String && element == element.downcase}.capitalize
  end

  def capitalized_elements
  end

end
