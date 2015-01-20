class Array

  def sum_of_numeric_elements
    array.inject{|mem, var| var.is_a? Fixnum ? mem + var : mem }
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

  def array
    @array
  end

end
