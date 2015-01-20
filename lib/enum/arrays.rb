class Array

  def sum_of_numeric_elements
    select { |el| el.is_a?(Numeric) }.inject(:+)
  end

  def product_of_numeric_elements
    select { |el| el.is_a?(Numeric) }.inject(:*)
  end

  def even_numeric_elements
    select { |el| el.is_a?(Fixnum) }.select { |num| num.even?}
  end

  def odd_numeric_elements
    select { |el| el.is_a?(Fixnum) }.select { |num| num.odd? }
  end

  def string_elements
    select { |el| el.is_a?(String) }
  end

  def lowercase_string_elements_as_uppercase
    select { |el| el.is_a?(String) }.select { |str| str == str.downcase }.map { |word| word.capitalize }
  end

  def capitalized_elements
    select { |el| el.is_a?(String) }.reject { |term| term == term.downcase }
  end

end

