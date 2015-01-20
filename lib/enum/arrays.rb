class Array

  def sum_of_numeric_elements
    select { |item| item.is_a? (Numeric)}.reduce(:+)
  end

  def product_of_numeric_elements
    select { |item| item.is_a? (Numeric)}.reduce(:*)
  end

  def even_numeric_elements
    select { |item| item.is_a? (Integer)}.select(&:even?)
  end

  def odd_numeric_elements
    select { |item| item.is_a? (Integer)}.select(&:odd?)
  end

  def string_elements
    select { |item| item.is_a? (String) }
  end

  def lowercase_string_elements_as_uppercase
    select { |item| item.is_a? (String)}.reject { |item| item =~ /[A-Z]/}.map(&:capitalize)
  end

  def capitalized_elements
    select { |item| item.is_a? (String)}.select { |item| item =~ /[A-Z]/}
  end

end
