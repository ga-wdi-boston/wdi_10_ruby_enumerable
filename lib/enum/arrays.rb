class Array

  def sum_of_numeric_elements
    select { |ele| ele.is_a? (Numeric)}.inject(:+)
  end

  def product_of_numeric_elements
    select { |ele| ele.is_a? (Numeric)}.inject(:*)
  end

  def even_numeric_elements
    select { |ele| ele.is_a?(Integer) && ele % 2 == 0 }
  end

  def odd_numeric_elements
    select { |ele| ele.is_a?(Integer) && ele % 2 != 0 }
  end

  def string_elements
    select { |ele| ele.is_a?(String) }
  end

  def lowercase_string_elements_as_uppercase
    select { |ele| ele.is_a?(String) && ele.chars.first == ele.chars.first.downcase }.map(&:capitalize)
  end

  def capitalized_elements
    select { |ele| ele.is_a?(String) && ele.chars.first == ele.chars.first.capitalize }
  end

end
