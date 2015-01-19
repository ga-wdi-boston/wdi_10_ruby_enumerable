class Array
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def sum_of_numeric_elements
    array.select {|elem| elem.is_a?(Numeric)}.inject {|sum, elem| sum + elem}
  end

  def product_of_numeric_elements
    array.select {|elem| elem.is_a?(Numeric)}.inject {|product, elem| product * elem}
  end

  def even_numeric_elements
    array.select {|elem| elem.is_a?(Fixnum)}.select {|elem| elem.even?}
  end

  def odd_numeric_elements
    array.select {|elem| elem.is_a?(Fixnum)}.select {|elem| elem.odd?}
  end

  def string_elements
    array.select {|elem| elem.is_a?(String)}
  end

  def lowercase_string_elements_as_uppercase
    array.select {|elem| elem.is_a?(String)}.select {|elem| elem == elem.downcase}.map {|elem| elem.capitalize}
  end

  def capitalized_elements
    array.select {|elem| elem.is_a?(String)}.select {|elem| elem[0] == elem[0].upcase}
  end

end
