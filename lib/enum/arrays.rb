class Array

  def sum_of_numeric_elements
    # inject(0){ |memo, element| element.is_a? Numeric ? (memo + element) : element }
    select { |element| element.is_a? Numeric }.inject(:+)
  end

  def product_of_numeric_elements
    select{ |element| element.is_a? Numeric }.inject(:*)
  end

  def even_numeric_elements
    select{ |element| element.is_a?(Fixnum) && (element % 2 == 0)}
  end

  def odd_numeric_elements
    select{ |element| element.is_a?(Fixnum) && (element % 2 != 0)}
  end

  def string_elements
    select{ |element| element.is_a?(String) }
  end

  def lowercase_string_elements_as_uppercase
    string_elements.map{ |element| element == element.downcase ? element.capitalize : next }.compact
  end

  def capitalized_elements
    string_elements.reject{ |element|  element == element.downcase }
  end

end
