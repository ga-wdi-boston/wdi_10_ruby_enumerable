class Array

  def initialize(my_array)
     @my_array = my_array
  end

  def sum_of_numeric_elements
     @my_array.select{ |i| i.is_a? (Numeric)}.inject{ |number,sum| number + sum}.to_f
  end

  def product_of_numeric_elements
    @my_array.select{ |i| Integer(i) rescue false}.inject{ |number,mult| number * mult}.to_i.to_f # question about this
  end

  def even_numeric_elements
    @my_array.to_a.select{ |i| i.even? }
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
