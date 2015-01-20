require 'pry'
class Array

  def sum_of_numeric_elements
    reduce(0) {|sum, element| (element.class == Fixnum || element.class == Float)? sum += element : sum}
  end

  def product_of_numeric_elements
    reduce(1) {|product, element| (element.class == Fixnum || element.class == Float)? product *= element : product}
  end

  def even_numeric_elements
    map {|element| element %2 == 0? element : nil}
  end

  def odd_numeric_elements
  end

  def string_elements
  end

  def lowercase_string_elements_as_uppercase
  end

  def capitalized_elements
  end

end
