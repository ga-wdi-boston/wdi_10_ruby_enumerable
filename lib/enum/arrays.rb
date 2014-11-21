class Array

  def sum_of_numeric_elements
    self.select { |x| x.is_a?(Fixnum) || x.is_a?(Float) }.reduce(:+)
  end

  def product_of_numeric_elements
    self.select { |x| x.is_a?(Fixnum) || x.is_a?(Float) }.reduce(:*)
  end

  def even_numeric_elements
    self.select { |x| x % 2 == 0 if x.is_a?(Fixnum) }
  end

  def odd_numeric_elements
    self.select { |x| x % 2 != 0 if x.is_a?(Fixnum) }
  end

  def string_elements
    self.select { |x| x.is_a?(String) }
  end

  def lowercase_string_elements_as_uppercase
    self.select { |x| x if x.is_a?(String) && x == x.downcase }.map(&:capitalize)
  end

  def capitalized_elements
    self.select { |x| x if x.is_a?(String) && x == x.split.map(&:capitalize).join(' ') }
  end

end
