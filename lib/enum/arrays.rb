class Array

  def sum_of_numeric_elements
    self.select { |num| num.is_a? (Numeric) }.reduce(:+)
  end

  def product_of_numeric_elements
    self.select { |num| num.is_a? (Numeric) }.reduce(:*)
  end

  def even_numeric_elements
    self.select { |num| num.is_a? Integer }.select { |num| num.even? }
  end

  def odd_numeric_elements
    self.select { |num| num.is_a? Integer }.select { |num| num.odd? }
  end

  def string_elements
    self.select { |string| string.is_a? String }
  end

  def lowercase_string_elements_as_uppercase
    self.select { |string|  string.is_a? String }.select { |word| word == word.downcase}.map(&:capitalize)
  end

  def capitalized_elements
    self.select { |string| string.is_a? String }.select { |word| word != word.downcase}
  end

end
