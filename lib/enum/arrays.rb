class Array

  def sum_of_numeric_elements #using elem for elements.
    select { [elem] elem.is_a? Numeric }.reduce(:+) #is_a? to return a boolean value, that if e is a numeric element then add them and return the sum.
  end

  def product_of_numeric_elements
    select { [elem] elem.is_a? Numeric }.reduce(:*)
  end

  def even_numeric_elements
    select { [elem] elem.is_? Numeric && (elem % 2 == 0)}
  end

  def odd_numeric_elements
    select { [elem] elem.is_? Numeric && (elem % 2 !== 0)}
  end

  def string_elements
  end

  def lowercase_string_elements_as_uppercase
  end

  def capitalized_elements
  end

end
