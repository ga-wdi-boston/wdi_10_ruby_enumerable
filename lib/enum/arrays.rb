class Array

  def sum_of_numeric_elements
    self.select { |el| el.is_a?(Numeric) }.inject(:+)
  end

  def product_of_numeric_elements
    self.select { |el| el.is_a?(Numeric) }.inject(:*)
  end

  def even_numeric_elements
    self.select { |el| el.is_a?(Fixnum) }.select { |num| num % 2 == 0 }
  end

  def odd_numeric_elements
    self.select { |el| el.is_a?(Fixnum) }.select { |num| num % 2 == 1 }
  end

  def string_elements
    self.select { |el| el.is_a?(String) }
  end

  def lowercase_string_elements_as_uppercase
    self.select { |el| el.is_a?(String) }.select { |str| str == str.downcase }.map { |word| word.capitalize }
  end

  def capitalized_elements
    self.select { |el| el.is_a?(String) }.reject { |term| term[0] == term[0].downcase }
  end

end

