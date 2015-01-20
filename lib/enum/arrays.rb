class Array

  def initialize(array)
    @array = array
  end

  def sum_of_numeric_elements
    sum = @array.reject(String)
    sum.reduce(:+)
  end

  def product_of_numeric_elements
  end

  def even_numeric_elements
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
